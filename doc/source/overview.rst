Document purpose
----------------

This document provides instructions for installing, configuring and using FWaaS
plugin for Fuel.


Key terms, acronyms and abbreviations
-------------------------------------

+----------------------------+------------------------------------------------+
| Term/acronym/abbreviation  | Definition                                     |
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

