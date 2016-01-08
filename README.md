Oracle Database Provisioning
============================

Oracle Database Provisioning repository based on the following tools:

- [Packer](https://packer.io/): Machine/Container image builder

- [Ansible](http://www.ansible.com/): Automation tool to provision configurations.

Builders
--------

Images are built by Packer using the following virtualization platforms:

- [VirtualBox](http://virtualbox.org/)

- [Docker](http://docker.com/)

Images Repositories
-------------------

Images are pushed to the following repositories:

- [Atlas](http://atlas.hashicorp.com/): Here are stored Vagrant Boxes using
VirtualBox provider.

- [Docker Hub](https://hub.docker.com/): Here are stored Docker images.

Versions
--------

- **oracle-database-11g**

  - Atlas: [https://atlas.hashicorp.com/jeqo/boxes/oracle-database-11g](https://atlas.hashicorp.com/jeqo/boxes/oracle-database-11g)

  - Docker Hub: [https://hub.docker.com/r/jeqo/oracle-database-11g/](https://hub.docker.com/r/jeqo/oracle-database-11g/)

Directory Structure
-------------------

- roles: Ansible Roles.

- samples: Usage samples.
