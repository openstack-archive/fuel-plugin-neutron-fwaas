.. _installation:

Installation Guide
-------------------

Installing FWaaS plugin
+++++++++++++++++++++++

#. Download the plug­in from `Fuel Plugins Catalog <https://software.mirantis.com/download-mirantis-openstack-fuel-plugins/>`_.

#. Copy the plug­in on already installed Fuel Master node::

      [user@home ~]$ scp fwaas-plugin-2.0-2.0.0-0.noarch.rpm root@:/
      <the_Fuel_Master_node_IP>:~/

#. Log into the Fuel Master node. Install the plugin::

      [root@fuel ~]# fuel plugins --install fwaas-plugin-2.0-2.0.0-0.noarch.rpm

#. Verify that the plugin is installed correctly::

      [root@fuel ~]# fuel plugins --list
      id | name         | version | package_version
      ---|--------------|---------|----------------
      1  | fwaas_plugin | 2.0.0   | 2.0.0


Creating Environment with FWaaS
+++++++++++++++++++++++++++++++

1. After plug­in is installed, create a new OpenStack environment with Neutron.

2. `Configure your environment <http://docs.mirantis.com/openstack/fuel/fuel-7.0/user-guide.html#configure-your-environment/>`_.

3. Open the Settings tab of the Fuel web UI and scroll down the page. Select
   FWaaS plugin checkbox:

   .. image:: _static/fwaas_in_fuel_ui.png

4. `Deploy your environment <http://docs.mirantis.com/openstack/fuel/fuel-7.0/user-guide.html#deploy-changes/>`_.

