# vi: set ft=yaml.jinja :

{% set version = '3.0.1' %}

include:
  -  libssl1_0_0

couchbase-server:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - couchbase-server-community:    http://packages.couchbase.com/releases/{{ version }}/couchbase-server-community_{{ version }}-ubuntu12.04_amd64.deb
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - couchbase-server-community:    http://packages.couchbase.com/releases/{{ version }}/couchbase-server-community-{{ version }}-centos6.x86_64.rpm
     {% endif %}
  service.running:
    - enable:      True
    - require:
      - pkg:       libssl1_0_0
    - watch:
      - pkg:       couchbase-server

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

/sys/kernel/mm/transparent_hugepage/enabled:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0644'
    - contents:    never

vm.swappiness:
  sysctl.present:
    - value:       0
    - require:
      - pkg:       procps

{% endif %}
