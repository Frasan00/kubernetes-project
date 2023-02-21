### Kubernetes theory ###

1) What is kubernetes?

- Kubernetes is an open source container orchestration tool that manages containers on physical hardware, virtual machines or cloud (or a mix of those)
- Kubernetes is made to coordinate and manage lots of containers that have micorservicies (node server, client, keycloak etc.)


2) kubernetes features

- High availability (always running, alwawys accessable)
- Salability (scale microservicies to fetch the kind of traffic we have)
- Backup and restore (if something happens to a microservice, there is a method to recover the data it was holding and restore it)


3) kubernetes infrastructure
- A kubernetes cluster is made of:

# Master node 
- It's the controller that runs on a vm or physical hardware
- Runs an api server that works as a eentryopoint to the cluster, so each cluster is reachable from this entrypoint
- Runs a controller manager that tracs the events on the cluster and acts if something happens like a database that goes down
- Runs a scheduler, programs containers on each node depending by the workflow, and schedules on what node a container should be added
- Runs an etcd that holds the current state of the cluster, works as a backup
- Virtual networks allows to acctively use all the resources of the cluster with a connection between every cluster element
- There is also at least one backup copy of the master node in case it goes down

# Worker nodes 
-worker nodes have a kubelet running on (kubelet is a kubernetes process that allows the cluster to talk to each worker and let the workers node talk to wach other)
- Each worker also has different number of containers running


4) Kubernetes components

# Pod


# Service

# ingress

# ConfigMap

# Secret

# Deployment

# StateFulSet

# DaemonSet