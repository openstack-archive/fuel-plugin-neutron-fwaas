===============================================
Fuel plugin for FWaaS functionality in  Neutron
===============================================

https://blueprints.launchpad.net/fuel/+spec/support-fwaas-in-mos

FWaaS (FireWall-as-a-Service) is Neutron extension that introduces firewall
feature set.
Neutron FwaaS  provides a cloud-centric abstractions for a security feature
set spanning traditional L2/L3 firewalls to richer application-aware
next-generation firewalls.
This plugin uses IPTables driver.

Problem description
===================

FWaaS is a very popular and useful feature, which controls the incoming and
outgoing network traffic based on an applied rule set. A firewall establishes
a barrier between a trusted, secure internal network and another network
(e.g., the Internet) that is assumed not to be secure and trusted. Today
it is a neccesary functionality for the using OpenStack in production.

Proposed change
===============

Implement FUEL plugin which will configure FWaaS functionality in Neutron
and Horizon.

Alternatives
------------

It also might be implemented as a part of FUEL core, but we decided to make
it as a plugin for several reasons:
* Community decided to separate FWaaS and other aaS services into their own
  project(repo), so we would do it the same way.
* Another reason is that any new additional functionality makes a project and
  testing more difficult, which is an additional risk for the FUEL release.

Data model impact
-----------------

None

REST API impact
---------------

None

Upgrade impact
--------------

None

Security impact
---------------

None

Notifications impact
--------------------

None

Other end user impact
---------------------

None

Performance Impact
------------------

None

Other deployer impact
---------------------

None

Developer impact
----------------

None

Implementation
==============

Assignee(s)
-----------

Primary assignee:

Feature Lead: Andrey Epifanov
Mandatory Design Reviewers: Stanislaw Bogatkin, Sergey Kolekonov,
Sergey Vasilenko
Developers: Andrey Epifanov
QA: Timur Nurlygayanov

Work Items
----------

* Implement FUEL plugin.
* Implement puppet manifests.
* Testing.
* Write documentation.

Dependencies
============

* FUEL 6.0 and higher.

Testing
=======

* Prepare a test plan.
* Test deployment with activated plugin for all FUEL deployment modes.
* Test FWaaS functionality as well:
  https://wiki.openstack.org/wiki/Quantum/FWaaS/Testing
* Integration tests with other OpenStack components and Neutron plugins.

Documentation Impact
====================

* Deployment Guide (how to prepare an env for installation, how to install
  the plugin, how to deploy OpenStack env with the plugin).
* User Guide (which features the plugin provides, how to use them in the
  deployed OS env).
* Test Plan.
* Test Report.

References
==========

* https://wiki.openstack.org/wiki/Neutron/FWaaS
* https://wiki.openstack.org/wiki/Neutron/FWaaS/HowToInstall
* https://wiki.openstack.org/wiki/Quantum/FWaaS/Testing
