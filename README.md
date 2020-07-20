# Repo containing everything to do with Ansible and Infrastructure as code

### User Installation

1. `$ git clone <repo>` - clone this repo
2. `$ vagrant up` - starts up VMs

ANSIBLE CONTROLLER

  [within ansible server]

3. `$ cd /etc/ansible`
4. `$ sudo nano hosts`
5. enter this:

  `[web]
  192.168.10.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
  [db]
  192.168.10.20 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
  [aws]
  192.168.10.30 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant`

  This step tells the ansible controller which agent nodes to 'control';

6. `$ ansible all -m ping` - pings all servers
    should get ping:pong as result
    if not, try the following authentication method

PASSWORD AUTHENTICATION

    [within agent server]
    
7. `$ cd /etc/ssh`
8. `$ sudo nano sshd_config` - edit: 'PermitRootAccess yes', 'PasswordAuthentication' yes'
9. `$ sudo passwd root` - set password
    (you won't see graphical input feedback)
10. `$ sudo service ssh restart`

SETTING UP KEYS

   [within ansible server]
11. `$ cd ~/.ssh`
12. `$ ssh-keygen` - this will generate rsa key pair
13. `$ ssh-copy-id root@{IP}` - sends key to specified IP
    (you will now enter the password set in step 9)
14. Repeat step 13 for each agent node.
15. `$ ansible all -m ping` - pings all servers
  should now get ping:pong as result

   `ssh root@{IP}` - to access agent server via ansible controller

## Playbook/Node App Installation
