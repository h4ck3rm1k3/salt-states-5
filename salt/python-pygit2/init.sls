# vi: set ft=yaml.jinja :

{# set name    = salt['config.get']('libgit2-dev:pkg:name') #}
{# set latest  = salt['pkg.latest_version'](name) #}
{# set version = salt['pkg.version'](name) #}

include:
# -  gcc
# -  libgit2-dev
  -  python-apt
# -  python-cffi
# -  python-dev
# -  python-pip

python-pygit2:
  pkgrepo.managed:
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       F3FA6A64F50B4114
    - ppa:         dennis/python
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   python-pygit2
# pip.installed:
#   - name:        pygit2 == {# (latest|default(version, True)).split('-')[0] #}
#   - require:
#     - pkg:       gcc
#     - pkg:       python-cffi
#     - pkg:       python-dev
#     - pkg:       python-pip
#   - watch:
#     - pkg:       libgit2-dev
