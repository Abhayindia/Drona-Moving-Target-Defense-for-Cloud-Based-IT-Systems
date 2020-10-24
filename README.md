# Drona-Moving-Target-Defense-for-Cloud-Based-IT-Systems
Moving Target Defense for Cloud-Based IT Systems is a platform that 
automatically adapts multiple aspects of the network’s logical and physical configuration. 
The platform is targeting OpenStack and is built on top of Drona. 
Drona is a framework that captures the high-level user requirements and translates them into 
a working IT system on a cloud infrastructure. 

## General Requirements
- In order to use MTD CBITS and/or Drona, the user needs an OpenStack cloud infrastructure (extensively tested on Icehouse release) that the VM hosting MTD CBITS/Drona  can reach.

- The MTD CBITS/Drona VM should be reachable by the instances running on the OpenStack infrastructure (i.e., VM should run in bridged mode).

- The necessary Puppet manifests that are needed for the system that will be deployed with MTD CBITS or Drona.

