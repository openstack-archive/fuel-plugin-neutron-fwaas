# FWaaS

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with FWaaS](#setup)
    * [What FWaaS affects](#what-fwaas-affects)
    * [Beginning with VPNaaS](#beginning-with-fwaas)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This is FWaaS plugin for FUEL, which provides an ability to setup FWaaS Neuton extention
that introduces Firewall feature set.

## Module Description

FWaaS Neutron extention provides additional perimeter firewall management to Networking.
FWaaS uses iptables to apply firewall policy to all Networking routers within a project.
It supports one firewall policy and logical firewall instance per project.

## Setup

### What FWaaS affects

* During installation manifests add a couple options in neutron.conf and enable FWaaS tab in Horizon.

### Beginning with VPNaaS

How to use FWaaS you can find here:
http://docs.openstack.org/api/openstack-network/2.0/content/fwaas_ext.html

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This plugin supports only the following OS: CentOS 6.4 and Ubuntu 12.04.
