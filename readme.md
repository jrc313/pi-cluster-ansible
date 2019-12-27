# Ansible Playbook for Raspberry PI cluster

This playbook configures a ClusterHAT based cluster.

- Change the default password on host and nodes
- Install and upgrade apt packages
- Generate new SSH host keys
- Disable password authentication for SSH
- Creates an SSH key on the host and pushes it to each of the nodes
- Pushes the Ansible server ssh key to the nodes to allow Ansible to connect to the nodes
- Creates a service on the host to start the nodes on boot
- Install Docker and setup a swarm