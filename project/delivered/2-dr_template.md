# Infrastructure

## AWS Zones
Identify your zones here:
- Primary : us-east-2a, us-east-2b, us-east-2c
- Secondary : us-west-1a, us-west-1c

## Servers and Clusters
- 3 EC2 instances named Ubuntu-Web per each region
- 2 EC2 instances for EKS cluster in each region
- AMI image used by Ubuntu-Web EC2 instances stored in each region


### Table 1.1 Summary
| Asset                     | Purpose                                                                       | Size                                                                   | Qty                                                             | DR                                                                                                           |
|---------------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name                | Brief description                                                             | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| AMI                       | AMI for EC2 instances used for web servers                                    |                                                                        | 1                                                               | Created in both regions                                                                                      |
| EC2 instance              | Udacity-Web web server                                                        | t3.medium                                                              | 3                                                               | DR - deployed in both regions                                                                                |
| EC2 instance              | EKS cluster worker nodes                                                      | t3.medium                                                              | 2                                                               | DR - EKS cluster is deployed in both regions                                                                 |
| Keypair                   | ssh keypair for accessing EC2 instances                                       |                                                                        | 1                                                               | created in both regions                                                                                      |
| VPC                       | networking setup for applications in a region                                 |                                                                        | 1                                                               | DR - deployed in both regions                                                                                |
| IAM roles                 | Roles for EKS cluster and worker nodes                                        |                                                                        | 2                                                               | DR - deployed in each region                                                                                 |
| Security Group            | Configurations for firewall rules for EC2 instances, rds nodes, and EKS nodes |                                                                        | 3                                                               | DR - deployed in each region                                                                                 |
| RDS cluster with 2 nodes  | RDS instances with 1 primary and other read replica                           |                                                                        | 2                                                               | Cluster deployed in both regions, with the second being read replica                                         |
| Application load balancer | To control traffic to EC2 instances and Grafana dashboard                      |                                                                        | 2                                                               | DR - deployed in each region                                                                                 |
| Subnets                   | VPC subnets per each availability zone                                        |                                                                        | 3                                                               | DR - deployed in each zone of both regions                                                                   |
| Prometheus/Grafana stack  | Monitoring stack                                                              |                                                                        | 1                                                               |                                                                                                              |

### Descriptions
More detailed descriptions of each asset identified above.:
- AMI are holding the application executables. They should be created and stored in both regions. Copied from us-east-1 region.
- ec2 instances for web server should be created per availability zone in the region. Regarding instance type, it is not defined as a requirement that's why t3.medium would be enough of for the beginning.
- VPC have subnets created in each availability zone of each region.
- Keypairs should exist in both regions.
- RDS cluster is deployed as primary cluster in us-east-2 region with one write instance and other read instance. A secondary read cluster is deployed in us-west-1 with replication from us-east-2 cluster. Secondary cluster has 2 read instances.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
- Configure S3 bucket for terraform state
- Create keypairs
- Create AMI image
- Deploy VPC, security groups,ALB,  EC2 instances and an EKS cluster in the other region
- Configure a read RDS cluster with replication from primary rds cluster
- Monitoring stack configurations(prometheus configs, grafana dashboards json, alerting configurations) should also be stored somewhere (git repo) in order to be able to reproduce the same configuration in case region with monitoring stack fails.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
- Stop RDS instances in primary region, if not yet stopped, and fail over will start automatically towards the read cluster.
- Point VIP used for accessing RDS towards the new rds cluster write and read replicas
- Point VIP of flask application towards the application load balancer in the failed-over region
- Application should be able to connect to database and be accessible through the common DNS/ Route 53 record .
