#!/bin/bash
echo "Starting client 1 ..."\n

sudo nomad agent -config ~/conf/client2.hcl
