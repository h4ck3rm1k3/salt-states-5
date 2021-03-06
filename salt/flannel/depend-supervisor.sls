# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  flannel
  -  supervisor

flannel:
  supervisord.running:
    - watch:
      - service:   supervisor
      - file:     /usr/bin/flannel
#     - cmd:       go get flannel

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update &
