=================
Salt Vagrant Demo
=================

A Salt LAB configured for PosAM in  Vagrant. Vagrant file will create one
SaltMater and 2 SaltMinions with configured network and keys for salt
communication.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone http://git.posam.sk/cholewam/salt-posAm-lab/
    cd salt-posAm-lab
    vagrant plugin install vagrant-vbguest
    vagrant up


This will download an Cenots7  VirtualBox image and create three virtual
machines for you. One will be a Salt Master named `master` and two will be Salt
Minions named `minion1` and `minion2`.  The Salt Minions will point to the Salt
Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping

Lab Info
=========
All machines are configured at lab network 192.168.50.*. Master is addressed as
192.168.50.10  and minions have incremental IP.

Machines are build at Centos7.

Basic Vagrant command
=====================
How to start list connect and destroy:

.. code-block:: bash

    vagrant status
    vagrant up 
    vagrant ssh <name of machine>
    vagrant destroy


