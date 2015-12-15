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

#This class contains necessary parameters for all other manifests

class fwaas::params {

  $ha                 = hiera('deployment_mode') ? { 'ha_compact'=>true, default=>false }
  $l3_enabled         = $::is_l3_enabled ? { 'Started'=>true, default=>false }

  $server_service     = 'neutron-server'

  if($l3_enabled) {

    $l3_agent_service   = 'neutron-l3-agent'
    $p_l3_agent         = 'p_neutron-l3-agent'

  } else {

    $l3_agent_service   = 'neutron-vpn-agent'
    $p_l3_agent         = 'p_neutron-vpn-agent'

  }

  if($::osfamily == 'Redhat') {
    $server_package     = 'openstack-neutron'
    $fwaas_package      = 'python-neutron-fwaas'

    $dashboard_package  = 'openstack-dashboard'
    $dashboard_service  = 'httpd'
    $dashboard_settings = '/etc/openstack-dashboard/local_settings'

    $node_name          = $full_node_name

  } elsif($::osfamily == 'Debian') {

    $server_package     = 'neutron-server'
    $fwaas_package      = 'python-neutron-fwaas'

    $dashboard_package  = 'python-django-horizon'
    $dashboard_service  = 'apache2'
    $dashboard_settings = '/etc/openstack-dashboard/local_settings.py'

    $array_node_name    = split($full_node_name, '[.]')
    $node_name          = $array_node_name[0]

  } else {

    fail("Unsupported osfamily ${::osfamily}")

  }
}
