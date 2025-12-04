# Spark docker

# General

A quick and easy setup for running Jupyter notebooks with a spark (4.0.1) cluster in a Dockerized environment, managed using [*docker-compose*](https://docs.docker.com/compose/).

## Features

- GitHub Template repository for easy reuse.
- Dockerized Jupyter environment for consistent, reproducible notebook runs.
- Simplified sharing of notebooks using the `work` directory.
- Compatibility with GitHub Code Spaces for seamless remote development.

# Installation

The following steps will make you run your spark cluster's containers.



## Build the image and start the cluster spark and jupyter (on spark master)


```sh
$ ./start-cluster-spark.sh
```
TP_spark.sh is defined as follow:

```bash
cd spark
docker-compose up -d
```

The Docker compose will create a cluster spark composed by the following containers:

container | Exposed ports
---|---- 
spark-master|4040:4040 <br> 7001:7000 <br> 7077:7077<br> 9080:8080 <br>8888:8888
spark-worker-a|7002:7000 <br>9082:8080
spark-worker-b|7003:7000 <br>9083:8080
spark-worker-c|7004:7000 <br>9084:8080
spark-history|18080:18080



## Validate your cluster

After starting spark (read the logs of container master of cluster spark), a server jupyter have been launched.  You need the value of the token.
Just copy and start the link begin with : 

http://127.0.0.1:8888/lab?token=...

## Modify ./spark/docker-compose.yml

For your volumes, youi need to define your own directory paths in modifying docker-compose.yml

    volumes:
       - your apps Path:/opt/spark-apps
       - your spark-data Path:/opt/spark-data
       - your spark-events Path:/tmp/spark-events

# Resource Allocation 

This cluster is shipped with one master, three workers and one spark history. Each of these has a particular set of resource allocation(basically RAM & cpu cores allocation).

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


# Run Sample applications

Start a notebook in jupyter
