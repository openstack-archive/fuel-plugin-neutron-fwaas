#This class contains necessary parameters for all other manifests

class fwaas::params {

  $fuel_settings      = parseyaml($astute_settings_yaml)
  $ha                 = $fuel_settings['deployment_mode'] ? { 'ha_compact'=>true, default=>false }
  $vpn_enabled        = $::is_vpn_enabled ? { 'clone_p_neutron-vpn-agent'=>true, default=>false }

  $server_service     = 'neutron-server'

  if($vpn_enabled) {

    $l3_agent_service   = 'neutron-vpn-agent'
    $p_l3_agent         = 'p_neutron-vpn-agent'

  } else {

    $l3_agent_service   = 'neutron-l3-agent'
    $p_l3_agent         = 'p_neutron-l3-agent'

  }

  if($::osfamily == 'Redhat') {
    $server_package     = 'openstack-neutron'

    $dashboard_package  = 'openstack-dashboard'
    $dashboard_service  = 'httpd'
    $dashboard_settings = '/etc/openstack-dashboard/local_settings'

    $node_name          = $full_node_name

  } elsif($::osfamily == 'Debian') {

    $server_package     = 'neutron-server'

    $dashboard_package  = 'python-django-horizon'
    $dashboard_service  = 'apache2'
    $dashboard_settings = '/etc/openstack-dashboard/local_settings.py'

    $array_node_name    = split($full_node_name, '[.]')
    $node_name          = $array_node_name[0]

  } else {

    fail("Unsupported osfamily ${::osfamily}")

  }
}
