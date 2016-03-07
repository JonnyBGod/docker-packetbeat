[![](https://badge.imagelayers.io/jonnybgod/packetbeat:latest.svg)](https://imagelayers.io/?images=jonnybgod/packetbeat:latest)

# What is Packetbeat?
Packetbeat is an open source network packet analyzer that ships the data to Elasticsearch. Think of it like a distributed real-time Wireshark with a lot more analytics features.

![alt text](https://static-www.elastic.co/assets/blta28996a125bb8b42/packetbeat-fish-nodes-bkgd.png?q=755 "Packetbeat logo")

> https://www.elastic.co/products/beats/packetbeat

# Why this image?

This runs the Packetbeat agent inside it's own container, but by mounting the network host it is able to see the traffic from the other containers or from the applications running on the hosts.

# How to use this image
Build with:

```bash
docker build -t packetbeat .
```

Start Packetbeat as follows:

```bash
docker run -d \
  --net=host \
  -e LOGSTASH_HOST=monitoring.xyz -e LOGSTASH_PORT=5044 \
  packetbeat
```

Two environment variables are needed:
* `LOGSTASH_HOST`: to specify on which server runs your Logstash
* `LOGSTASH_PORT`: to specify on which port listens your Logstash for beats inputs

Optional variables:
* `DEVICE`: to specify the network interfaces to sniff the data (default: any)
* `INDEX`: to specify the elasticsearch index (default: packetbeat)
* `LOG_LEVEL`: to specify the log level (default: error) 
* `SHIPPER_NAME`: to specify the Packetbeat shipper name (default: the container ID)
* `SHIPPER_TAGS`: to specify the Packetbeat shipper tags

The docker-compose service definition should look as follows:
```yalm
packetbeat:
  image: jonnybgod/packetbeat
  restart: unless-stopped
  net: host
  environment:
   - LOGSTASH_HOST=monitoring.xyz
   - LOGSTASH_PORT=5000
```
