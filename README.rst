==================
Nomad lab exabmple
==================

Nomad from Hashicorp example of implementation for using of Unicorn project.
More info about project: https://www.nomadproject.io/

In this lab simulation will be installd like simple cluster with 1 server and
2 clients running into vagrant VM. Access at UI http://localhost:4646/ui/jobs 

Instructions
============




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

Jobs
=========
We have only one jobs configured in conf folder. So you can easily run like:

Register:
.. code-block:: bash

  mad:~/conf$ nomad run example.nomad
    ==> Monitoring evaluation "6cd788d6"
      Evaluation triggered by job "example"
      Evaluation within deployment: "7116824b"
      Allocation "72de221e" created: node "fafe7111", group "jboss"
      Allocation "0ba8c710" created: node "6a5d1be6", group "jboss"
      Allocation "6f965a1f" created: node "6a5d1be6", group "jboss"
      Evaluation status changed: "pending" -> "complete"
  ==> Evaluation "6cd788d6" finished with status "complete"

Plan
