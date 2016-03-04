jonnybgod/packetbeat
=================

[![](https://badge.imagelayers.io/jonnybgod/packetbeat:latest.svg)](https://imagelayers.io/?images=jonnybgod/packetbeat:latest)

Packetbeat is an open source application monitoring and performance management (APM) system.
See https://www.elastic.co/products/beats for details.

This runs the Packetbeat agent inside it's own container, but by mounting the network host it is able to see the traffic from the other containers or from the applications running on the hosts.

## How to use

To build:

  docker build -t packetbeat .

To run:

  docker run --net=host -d packetbeat packetbeat -e -c /etc/packetbeat/packetbeat.conf

The `--net=host` part makes it possible to sniff the traffic from other containers.

## From docker hub

You can also pull the image from Docker Hub and run it like this:

  docker pull jonnybgod/packetbeat
  docker run --net=host -t -i jonnybgod/packetbeat packetbeat -e -c /etc/packetbeat/packetbeat.conf

But note that you will need to provide your own `packetbeat.conf`.