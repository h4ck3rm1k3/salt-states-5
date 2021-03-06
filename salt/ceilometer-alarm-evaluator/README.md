# ceilometer-alarm-evaluator

## Description:

Ceilometer aims to deliver a unique point of contact for billing systems to aquire all counters they need to establish  customer billing, accross all current and future OpenStack components. The delivery of counters must be tracable and auditable, the counters must be easily extensible to support new projects, and agents doing data collections should be independent of the overall system.

(A ceilometer is an instrument that measures cloud coverage.)

This package contains the alarm evaluator daemon.

## Depends:

  -  [ceilometer-common](/salt/ceilometer-common)
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
│   │       └── checks-ceilometer-alarm-evaluator.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── ceilometer-alarm-evaluator.conf
│   └── systemd
│       └── system
│           └── ceilometer-alarm-evaluator.service
├── init.sls
└── relate-sensu-api.sls
```
