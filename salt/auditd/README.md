# auditd

## Description:

The audit package contains the user space utilities for storing and searching the audit records generated by the audit subsystem in the Linux 2.6 kernel.

Also contains the audit dispatcher "audisp".

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-auditd.json
├── init.sls
└── relate-sensu-api.sls
```
