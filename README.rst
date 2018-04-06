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
We have only one jobs configured in conf folder. This will run 3 Docker containesr with Jboss. So you can easily run like:

Register:

.. code-block:: bash

     vagrant@nomad:~/conf$ nomad run  jboss.nomad
        ==> Monitoring evaluation "fa77b4b8"
        Evaluation triggered by job "example"
        Evaluation within deployment: "2ce8197c"
        Allocation "0d27cabe" created: node "e9ef7eef", group "jboss"
        Allocation "6a04ff57" created: node "735b088c", group "jboss"
        Allocation "d25b4026" created: node "735b088c", group "jboss"
        Evaluation status changed: "pending" -> "complete"
     ==> Evaluation "fa77b4b8" finished with status "complete"

Plan

.. code-block:: bash


    vagrant@nomad:~/conf$ nomad plan jboss.nomad
    + Job: "jboss"
    + Task Group: "jboss" (3 create)
    + Task: "jboss" (forces create)

    Scheduler dry-run:
    - All tasks successfully allocated.

    Job Modify Index: 0
    To submit the job with version verification run:

    nomad run -check-index 0 jboss.nomad

    When running the job with the check-index flag, the job will only be run if the
    server side version matches the job modify index returned. If the index has
    changed, another user has modified the job and the plan's results are
    potentially invalid.

A finally run:

.. code-block:: bash

   vagrant@nomad:~/conf$ nomad run -check-index 0 jboss.nomad
    ==> Monitoring evaluation "06caf6e2"
    Evaluation triggered by job "jboss"
    Evaluation within deployment: "cb8f3379"
    Allocation "2ec76c95" created: node "d2a44cae", group "jboss"
    Allocation "53419984" created: node "d2a44cae", group "jboss"
    Allocation "af02c31f" created: node "a858cbd5", group "jboss"
    Evaluation status changed: "pending" -> "complete"
    ==> Evaluation "06caf6e2" finished with status "complete" 

Check
=====

You can check by console or URL http://localhost:4646/ui/jobs

.. code-block:: bash
    
    vagrant@nomad:~/conf$ nomad status
    ID     Type     Priority  Status   Submit Date
    jboss  service  50        running  04/06/18 09:54:07 UTC
