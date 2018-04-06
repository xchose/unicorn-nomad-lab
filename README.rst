==================
Nomad lab exabmple
==================

Nomad from Hashicorp example of implementation for using of Unicorn project.
More info about project: https://www.nomadproject.io/

In this lab simulation will be installd like simple cluster {DC1} with 1 server and
2 clients running into vagrant VM.

Job will deploy 3 Docker containers with Jboss.

Monitoring all at at UI http://localhost:4646/ui/jobs

Instructions
============

This will install vagrant VM with predifned nomad environment and logon. 

.. code-block:: bash

    git clone git@git.posam.sk:cholewam/unicorn-nomad-lab.git
    cd unicorn-nomad-lab
    vagrant plugin install vagrant-vbguest
    vagrant up
    vagrant ssh

Now you can start server {ocated in /home/bin}. Since now you can check UI console http://localhost:4646/ui/jobs 

.. code-block:: bash

    vagrant@nomad:~$ startServer.sh
    Starting client 1 ...n
    ==> WARNING: Bootstrap mode enabled! Potentially unsafe operation.
      Loaded configuration from /home/vagrant/conf/server.hcl
    ==> Starting Nomad agent...
    ==> Nomad agent configuration:

                Client: false
             Log Level: DEBUG

                Region: global (DC: dc1)
                Server: true
               Version: 0.7.0

     ==> Nomad agent started! Log data will stream in below:g

Then start client1 and client2.

  .. code-block:: bash

    vagrant@nomad:~$ startClient1
    vagrant@nomad:~$ startClient2


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
