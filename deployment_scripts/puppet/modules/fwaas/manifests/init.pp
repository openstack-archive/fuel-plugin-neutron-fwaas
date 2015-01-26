#This class contains common changes for deployment FWaaS functionality in Neutron.
#It enables Firewall tab in Horizon and restart Neutron L3 agent.

class fwaas {

  include fwaas::params

  $node_name = $fwaas::params::node_name

  service { $fwaas::params::dashboard_service:
    ensure  => running,
    enable  => true,
  }

  service { $fwaas::params::server_service:
    ensure  => running,
    enable  => true,
  }

  exec { 'enable_fwaas_dashboard':
    command => "/bin/sed -i \"s/'enable_firewall': False/'enable_firewall': True/\" $fwaas::params::dashboard_settings",
    unless  => "/bin/egrep \"'enable_firewall': True\" $fwaas::params::dashboard_settings",
  }

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
    'service_providers/service_provider': value => 'FIREWALL:Iptables:neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver:default';
    'fwaas/enabled'                     : value => 'True';
    'fwaas/driver'                      : value => 'neutron.services.firewall.drivers.linux.iptables_fwaas.IptablesFwaasDriver';
  }

  Ini_subsetting['add_fwaas_service_plugin'] -> Neutron_config<||>
  Exec['enable_fwaas_dashboard'] -> Service[$fwaas::params::dashboard_service]

  if ! $fwaas::params::ha {

    service { $fwaas::params::l3_agent_service:
      ensure    => running,
      enable    => true,
    }

    Neutron_config<||> -> Service[$fwaas::params::l3_agent_service] ->
    Service[$fwaas::params::server_service] -> Service[$fwaas::params::dashboard_service]

  } else {

    exec { 'ban-l3-agent':
      path      => '/sbin:/usr/bin:/usr/sbin:/bin',
      onlyif    => 'pcs resource show p_neutron-l3-agent > /dev/null 2>&1',
      command   => "pcs resource ban p_neutron-l3-agent ${node_name}",
    }

    exec { 'waiting-for-l3-stop':
      path      => '/usr/sbin:/usr/bin:/sbin:/bin',
      tries     => 10,
      try_sleep => 10,
      command   => "pcs resource | grep p_neutron-l3-agent -A 2 | grep Stop | grep ${node_name}> /dev/null 2>&1",
    }

    exec { 'unban-l3-agent':
      path      => '/sbin:/usr/bin:/usr/sbin:/bin',
      onlyif    => 'pcs resource show p_neutron-l3-agent > /dev/null 2>&1',
      command   => "pcs resource clear p_neutron-l3-agent ${node_name}",
    }

    Neutron_config<||> ->
    Exec['ban-l3-agent'] -> Exec['waiting-for-l3-stop'] -> Exec['unban-l3-agent'] ->
    Service[$fwaas::params::server_service] -> Service[$fwaas::params::dashboard_service]
  }
}
