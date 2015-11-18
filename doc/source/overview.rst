.. _overview:

Document purpose
================

This document provides instructions for installing, configuring and using FWaaS
plugin for Fuel.


Key terms, acronyms and abbreviations
-------------------------------------

+----------------------------+------------------------------------------------+
| Term/abbreviation          | Definition                                     |
+============================+================================================+
| FWaaS                      | Firewall-as-a-Service                          |
+----------------------------+------------------------------------------------+
| IPTables                   | A user-space application program that allows   |
|                            | a system administrator to configure the tables |
|                            | provided by the Linux kernel firewall and the  |
|                            | chains and rules it stores. Different kernel   |
|                            | modules and programs are currently used for    |
|                            | different protocols; IPTables applies to IPv4, |
|                            | ip6tables to IPv6, arptables to ARP, and       |
|                            | ebtables to Ethernet frames.                   |
+----------------------------+------------------------------------------------+
| VM                         | Virtual Machine                                |
+----------------------------+------------------------------------------------+


FWaaS Plugin
------------

The Firewall-as-a-Service (FWaaS) is a Neutron plugin, which adds perimeter
firewall management to Networking. FWaaS uses IPTables to apply firewall policy
to the selected router. Whereas security groups operate at the instance-level,
FWaaS operates at the router-level.


Requirements
------------


+----------------------------+------------------------------------------------+
| Requirement                | Version/Comment                                |
+============================+================================================+
| Fuel                       | 7.0 release                                    |
+----------------------------+------------------------------------------------+
| OpenStack compatibility    | 2015.1 Kilo                                    |
+----------------------------+------------------------------------------------+
| Operating systems          | Ubuntu 14.04 LTS                               |
+----------------------------+------------------------------------------------+


Limitations
-----------

FWaaS plugin can be enabled only in environments with Neutron with ML2 plugin
with OpenVSwitch Mechanism driver (default configuration) as the networking
option and tested only with the IPTables driver.


Known issues
------------

Please make sure that your environment contains maintenance update MU-2 for
MOS 7.0 which has a fix for the High bug:
`[FWaaS] Error firewall state after updating policy or rule`_

If your environment doesn't contain MU-2, please apply it:
`How to apply Mirantis OpenStack 7.0 Maintenance Update`_

.. target-notes::
.. _[FWaaS] Error firewall state after updating policy or rule: https://bugs.launchpad.net/mos/7.0.x/+bug/1510576
.. _How to apply Mirantis OpenStack 7.0 Maintenance Update: https://docs.mirantis.com/openstack/fuel/fuel-7.0/maintenance-updates.html

