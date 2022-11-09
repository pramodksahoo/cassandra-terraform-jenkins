# Cassandra-Setup-Using-Ansible
Install and Setup Cassandra cluster. <br />

## Introduction
**Cassandra** is a free and open-source, distributed, wide-column store, **NoSQL database management system** designed to handle large amounts of
data across many commodity servers, providing high availability with no single point of failure.

This document can be referred for Multi Node cluster with Apache Cassandra.  
Here we are setting up cluster with **3 nodes** in different availability zone. 



Ansible version being used is : **2.9.25**

## Versions being installed: 
1. JDK - 1.8.0 <br />
2. Cassandra - 3.11.3 <br />

      
## Prerequistie:
Make sure there is a ssh connectivity between ansible host to all servers specified in the inventory file. <br />
     **ansible all -m ping -u ec2-user -i hosts.ini --private-key=/etc/ansible/pems/elk-pem-us-east-1.pem**


      
## Steps:
1. Update hosts in hosts file. 
2. Change cluster-name and dc-name accordingly in main.yml inside vars directory or can pass as option in command line
3. Run ansible command. <br />
      **ansible-playbook -i hosts.ini main.yml -u user --private-key=path-to-pem-key --extra-vars "cassandra_dc=dc-name"** <br />
      **Eg: ansible-playbook -u ec2-user -i hosts.ini main.yml --private-key=/etc/ansible/pems/elk-pem-us-east-1.pem --extra-vars "cassandra_dc=dummy-dc"** <br />
3. To check status of the cassandra nodes:
   a. Login into any one Cassandra node as sudo. <br />
   b. Move to **/home/cassandra/apache-cassandra/bin** <br />
   c. Run command: **./nodetool status** and you would see all 3 cassandra nodes will be up and running
