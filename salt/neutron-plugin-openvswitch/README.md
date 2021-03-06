# neutron-plugin-openvswitch

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the Open vSwitch plugin.

## Depends:

  -  [neutron-common](/salt/neutron-common)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── neutron
│       └── plugins
│           └── openvswitch
│               └── ovs_neutron_plugin.ini
└── init.sls
```
