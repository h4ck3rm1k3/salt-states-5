# vi: set ft=yaml.jinja :

{% from 'collectd/map.jinja' import map with context %}

{% set roles = [] %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.dict'](roles) %}
{% set plugins = [] %}
{% set psls    = sls.split('.')[0] %}

include:
  -  collectd

{% if      minions['graphite-carbon']
   and not minions['influxdb'] %}

/etc/collectd/collectd.conf:
  file.managed:
    - name:     {{ map.get('/etc/collectd/collectd.conf', {}).get('file', {}).get('name') }}
    - template:    jinja
    - source:      salt://{{ psls }}/etc/collectd/collectd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       collectd
    - watch_in:
      - service:   collectd

{% do  plugins.append('contextswitch') %}
{% do  plugins.append('cpu') %}
{% do  plugins.append('df') %}
{% do  plugins.append('disk') %}
{% do  plugins.append('entropy') %}
{% do  plugins.append('interface') %}
{% do  plugins.append('irq') %}
{% do  plugins.append('load') %}
{% do  plugins.append('memory') %}
{% do  plugins.append('processes') %}
{% do  plugins.append('protocols') %}
{% do  plugins.append('swap') %}
{% do  plugins.append('tcpconns') %}
{% do  plugins.append('vmem') %}
{% for plugin in plugins %}

/etc/collectd.d/input-{{ plugin }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/collectd.d/input-{{ plugin }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/collectd.d
    - watch_in:
      - service:   collectd

{% endfor %}

/etc/collectd.d/output-graphite-carbon.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/collectd.d/output-graphite-carbon.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/collectd.d
    - watch_in:
      - service:   collectd

{% else %}

/etc/collectd.d/output-graphite-carbon.conf:
  file.absent:
    - watch_in:
      - service:   collectd

{% endif %}
