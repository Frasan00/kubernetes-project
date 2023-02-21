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
- worker nodes have a kubelet running on (kubelet is a kubernetes process that allows the cluster to talk to each worker and let the workers node talk to wach other)
- Each worker also has different number of containers running


4) Kubernetes components inside a node

# Pod
- A pod is an abstraction over a container, pods are layers containing running servicies (like nodejs server, db ecc..)
- Usually we have one application for pod
- Each pod has a private ip address for comunications with other pods
- When a pod dies a new ip address is assigned to the new pod

# Service
- A service is a static ip address attached to a pod, in order to not worry if a pod dies and it's ip is changed
- Pods communicate directly to the server 
- There is an external service to accept requests to our servicies from external resources (like browsers)
- A service can both be external or internal depending of if we want it to be reachable from the outside of our network

# ingress
- This is a entrypont to our pods from the end user, it's usually a domain that points to our external service

# ConfigMap
- Works as a configuration file containing env varibles and config files for our application
- This simplifies changes in our applications without having to re- run pods
# Secret
- It's a configMap for sensitive data, encrypting the data that containes

# Volumes
- Attaches a physical or cloud storage to a pod in order to have persistent data in case the pod dies

# Deployment
- We replicate our nodes with the same service (that works as a load balancer too)
- This will allow us to not have downtime while updating our application
- This is configured in the "replicas" configuration
- DB can't be replicated with replicas

# StateFulSet
- It's used to replicate stateful applications like databases
- It works like deployment but ensures that databases are syncronized in order to not have data flaws
- Normally databases are hosted outside kubernetes cause stateful replicas can be hard to manage

### Kubernetes configuration ### (Can be scripted with .yml or .json files)

# Minikube

- Used to quicly test locally a setup
- Creates a cluster
- Compacts master and worker nodes in a unique node

# Kubectl (cmd for kubernetes)

- Used to interact with a cluster