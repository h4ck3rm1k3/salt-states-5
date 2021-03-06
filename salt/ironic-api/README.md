# ironic-api

## Description:

Ironic is an Incubated OpenStack project which aims to provision bare metal machines instead of virtual machines, forked from the Nova Baremetal driver. It is best thought of as a bare metal hypervisor **API** and a set of plugins which interact with the bare metal hypervisors. By default, it will use PXE and IPMI in concert to provision and turn on/off machines, but Ironic also supports vendor-specific plugins which may implement additional functionality.

This package contains the API.

## Depends:

  -  [ironic-common](/salt/ironic-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ironic-api.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── ironic-api.conf
│   └── systemd
│       └── system
│           └── ironic-api.service
├── init.sls
└── relate-sensu-api.sls
```
