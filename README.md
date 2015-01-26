FWaaS plugin
============

FWaaS (Firewall-as-a-Service) is a Neutron extension that introduces Firewall feature set.

This repo contains all necessary files to build FWaaS Fuel plugin.
Currently the only supported Fuel version is 6.0.

Building the plugin
-------------------
1. Clone the fuel-plugins repo from https://github.com/stackforge/fuel-plugins
2. Install Fuel Plugin Builder using documentation from the fuel-plugins repo
3. Execute fpb --build <path>, where <path> is the path to the plugin's main
   folder (fwaas)
4. fwaas-plugin-1.0.0.fp plugin file will be created
5. Move this file to the Fuel master node and install it using
   the following command: fuel plugins --install fwaas-plugin-1.0.0.fp
6. Plugin is ready to use and can be enabled via Fuel WebUI ('Settings' tab)

Deployment details
------------------

FWaaS deployment requires only adding a couple parameters in neutron.conf and
enabling FWaaS tab in Horizon.


Accessing FWaaS functionality
------------------------------
Firewall settings can be found in Openstack Dashboard:
Project -> Network -> Firewall

Please use official Openstack documentation to obtain more information:
- http://docs.openstack.org/admin-guide-cloud/content/install_neutron-fwaas-agent.html
