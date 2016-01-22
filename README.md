oracle database provisioning
============================

with packer and ansible.

builders
--------

images are built by _packer_ using the following virtualization platforms:

- [virtualBox](http://virtualbox.org/)

- [docker](http://docker.com/)

image repositories
------------------

images are pushed to the following repositories:

- [atlas](http://atlas.hashicorp.com/): stores vagrant boxes using
_virtualBox provider_.

- [docker hub](https://hub.docker.com/): stores docker images.

versions
--------

- **oracle-database-se-11g-ol7**

  - atlas: [https://atlas.hashicorp.com/jeqo/boxes/oracle-database-se-11g-ol7](https://atlas.hashicorp.com/jeqo/boxes/oracle-database-se-11g-ol7)

  - docker hub: [https://hub.docker.com/r/jeqo/oracle-database-se-11g-ol7/](https://hub.docker.com/r/jeqo/oracle-database-se-11g-ol7/)

provisioning
------------

oracle database installation is provided by the following ansible roles:

- [oracle-database](https://galaxy.ansible.com/detail#/role/7146)

**important**

this images are generated only for development. for more information visit: [sysco.no](http://sysco.no)
