# mesos-master

## Description:



## Depends:

  -  [mesos](/salt/mesos)
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
│   │       └── checks-mesos-master.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── mesos-master.conf
│   └── systemd
│       └── system
│           └── mesos-master.service
├── init.sls
└── relate-sensu-api.sls
```
