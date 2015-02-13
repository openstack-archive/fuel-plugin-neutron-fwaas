FWaaS plugin
============

FWaaS (Firewall-as-a-Service) is a Neutron extension that introduces Firewall feature set.

This repo contains all necessary files to build FWaaS Fuel plugin.
Currently the only supported Fuel version is 6.0.

Building the plugin
-------------------

1. Clone the FWaaS plugin repo from `https://github.com/stackforge/fuel-plugin-neutron-fwaas`.
2. Install Fuel Plugin Builder:

    ``pip install fuel-plugin-builder``

3. Execute ``fpb --build <path>`` command, where <path> is the path to the plugin's main
   folder (fwaas). For example:

   ``fpb --build fuel-plugin-neutron-fwaas/

4. The fwaas-plugin-1.0.0.fp plugin file will be created.

5. Move this file to the Fuel Master node with secure copy (scp):

	``scp fwaas-plugin-1.0.0.fp root@:<the_Fuel_Master_node_IP address>:/tmp``
   ``cd /tmp``

6. Install it using the following command:

	``fuel plugins --install fwaas-plugin-1.0.0.fp``

6. Plugin is ready to use and can be enabled on the Settings tab of the Fuel web UI.

Note that you can also download the built FWaaS
plugin from
the [Fuel Plugins Catalog](https://software.mirantis.com/download-mirantis-openstack-fuel-plug-ins/).

Deployment details
------------------

FWaaS deployment requires only adding a couple parameters in neutron.conf and
enabling FWaaS tab in Horizon.

Accessing FWaaS functionality
------------------------------

Firewall settings can be found on the Openstack Dashboard (Horizon) in
Project -> Network -> Firewall.

Please use official Openstack documentation to obtain more information:
- http://docs.openstack.org/admin-guide-cloud/content/install_neutron-fwaas-agent.html
