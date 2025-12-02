# Spark docker

# General

A simple spark standalone cluster for your testing environment purposses. A *docker-compose up* away from you solution for your spark development environment.

The Docker compose will create a cluster spark composed by the following containers:

container|Exposed ports
---|---
spark-master|4040:4040 7001:7000 7077:7077 9080:8080 8888:8888
spark-worker-a|7002:7000 9082:8080
spark-worker-b|7003:7000 9083:8080
spark-worker-c|7004:7000 9084:8080
spark-history|18080:18080

# Installation

The following steps will make you run your spark cluster's containers.

## Modify ./spark/docker-compose.yml

For your volumes, youi need to define your own directory paths in modifying docker-compose.yml

    volumes:
       - your apps Path:/opt/spark-apps
       - your spark-data Path:/opt/spark-data
       - your spark-events Path:/tmp/spark-events

## Build the image


```sh
$ ./start_spark.sh
```
TP_spark.sh is defined as follow:

```bash
cd spark
docker-compose up -d
```


## Validate your cluster

After starting spark (read the logs of container master of cluster spark), a server jupyter have been launched.
Just copy and start the link begin with : 

http://127.0.0.1:8888/lab?token=y

# Resource Allocation 

This cluster is shipped with three workers and one spark master, each of these has a particular set of resource allocation(basically RAM & cpu cores allocation).

* The default CPU cores allocation for each spark worker is 3 core.

* The default RAM for each spark-worker is 1024 MB.

* The default RAM allocation for spark executors is 256mb.

* The default RAM allocation for spark driver is 128mb

* If you wish to modify this allocations just edit the env/spark-worker.sh file.

# Binded Volumes

To make app running easier I've shipped two volume mounts described in the following chart:

Host Mount|Container Mount|Purposse
---|---|---
apps|/opt/spark-apps|Used to make available your app's jars on all workers & master
data|/opt/spark-data| Used to make available your app's data on all workers & master

This is basically a dummy DFS created from docker Volumes...(maybe not...)

# Run Sample applications

Start a notebook in jupyter
