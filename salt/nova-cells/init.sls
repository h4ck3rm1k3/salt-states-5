# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  nova-common

nova-cells:
  pkg.installed:   []
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       nova-cells
#     - file:     /etc/nova/api-paste.ini
#     - file:     /etc/nova/logging.conf
      - file:     /etc/nova/nova.conf
#     - file:     /etc/nova/policy.json
