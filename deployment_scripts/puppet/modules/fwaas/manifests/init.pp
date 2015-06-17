#    Copyright 2015 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#
#
#
#This class contains common changes for deployment FWaaS functionality in Neutron.
#It enables Firewall tab in Horizon and restart Neutron L3 agent.


class fwaas::enable_in_neutron_config {

  ini_subsetting {'add_fwaas_service_plugin':
    ensure               => present,
    section              => 'DEFAULT',
    key_val_separator    => '=',
    path                 => '/etc/neutron/neutron.conf',
    setting              => 'service_plugins',
    subsetting           => 'neutron.services.firewall.',
    subsetting_separator => ',',
    value                => 'fwaas_plugin.FirewallPlugin',
  }

  neutron_config {
    'fwaas/enabled': value => 'True';
    'fwaas/driver' : value => 'neutron.services.firewall.drivers.linux.iptables_fwaas.IptablesFwaasDriver';
  }

  service { $fwaas::params::server_service:
    ensure  => running,
    enable  => true,
  }

  Neutron_config<||>                         ~> Service[$fwaas::params::server_service]
  Ini_subsetting['add_fwaas_service_plugin'] ~> Service[$fwaas::params::server_service]
}


class fwaas::enable_in_dashboard {

  service { $fwaas::params::dashboard_service:
    ensure  => running,
    enable  => true,
  }


  exec { 'enable_fwaas_dashboard':
    command => "/bin/sed -i \"s/'enable_firewall': False/'enable_firewall': True/\" ${fwaas::params::dashboard_settings}",
    unless  => "/bin/egrep \"'enable_firewall': True\" ${fwaas::params::dashboard_settings}",
  }

  Exec['enable_fwaas_dashboard'] ~> Service[$fwaas::params::dashboard_service]

}


class fwaas {

  require fwaas::params
  require fwaas::enable_in_neutron_config
  require fwaas::enable_in_dashboard

  if $fwaas::params::ha {

    service {$fwaas::params::p_l3_agent:
      ensure    => running,
      enable    => true,
      provider  => 'pacemaker',
      subscribe => Class[fwaas::enable_in_neutron_config],
    }

  } else {

    service {$fwaas::params::l3_agent_service:
      ensure    => running,
      enable    => true,
      subscribe => Class[fwaas::enable_in_neutron_config],
    }

  }

}
