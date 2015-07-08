windows-couchdb
=========

This role installs and configures Apache CouchDB 1.6.1 on Windows. 

Requirements
------------

This role uses Ansible (running on a Linux node) to install and configure Apache CouchDB on target nodes running Windows. 

It has been tested with a Linux node running CentOS 6.6 and Ansible 1.9.1 and a Windows 7 target node.

You must ensure that your Windows nodes have been correctly configured with PowerShell and WinRM ( see: http://docs.ansible.com/intro_windows.html ). 

How it works
------------

Due to the limited Windows support in Ansible 1.9.1 (i.e. lack of windows template module), this role implements a "phone home" pattern where some of the tasks run on the Ansible 'control' node. The Windows node then get in touch (via HTTP) to retrieve the results of certain actions. 

Role Variables
--------------

The role allows you to customize the port number that CouchDB uses (couchdb_port, set to 5984 by default).

Because the role starts a web server on Linux, we must communicate to the Windows nodes the IP address of that server. Currently, this is done via looking up the IP address which is associated with a given NIC. By default, this is set to nic1, which is the nic name used in Vagrant.

Dependencies
------------

None


Example Playbook
----------------

    ---
    - hosts: windows
      gather_facts: no
      roles:
      - {role: windows-couchdb, nic: eth1, couchdb_port: 5984 }

License
-------

Apache License, Version 2.0

Author Information
------------------

Gillaume Belrose, guillaume.belrose@quantel.com
