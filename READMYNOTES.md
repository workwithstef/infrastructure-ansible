### Infrastructure as Code (IaS)

- the process of creating our dev environment by using a source code/provision shell file


### Configuration Management tools

tools that put IAC into practice along with orchestration tools


Config Management tools include:
- Chef (ruby)
- Puppet
- Ansible

### Orchestration tools

tools include:
- Ansible
- Terraform

### Ansible - a high level language

(high level: python, java, etc --- low level: binary computing)

- Applicable in different terminal environment (powershell vs bash)
- Ansible is used for dealing with different package managers.
- Abstracting the most used commands and operations in provisioning so you can be more flexible.

[FLEXIBILITY | EASE OF USE | ROBUSTNESS | COST]

- Free
- Allows us to become infrastructure agnostic
- As it is a config management tool; increases robustness
- It is easy to use

### Ansible methodology
Ansible allows you to provision MULTIPLE servers, using playbook.yml
All available servers provisioned from the single Ansible Controller Server
therefore saves time & money

Ansible Controller links to other servers, using SSH connection

############
FOR WINDOWS:
Kernel - the backbone for any Operating System (macOS, Windows, Linux, etc.)
can create controller on windows using a Windows:Linux sub-system

Enable windows subsystem (search ' windows features' in start bar, and turn on subsystem feature)
Then install Ubuntu onto your machine
This should then allow you to create ansible controller on your local machine
############

### How to tell the Ansible server "You Are A Controller!"

  [within ansible server]
1. `$ cd /etc/ansible`
2. `$ sudo nano hosts`
3. enter this:
"""
[web]
192.168.10.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[db]
192.168.10.20 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
[aws]
192.168.10.30 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
"""
This step tells the ansible controller which servers to 'control'
4. `$ ping 192.168.10.10` - checks if specific server is responding
`ansible all -m ping` - checks all servers

PASSWORD AUTHENTICATION

  [within agent server]
5.  `$ cd /etc/ssh`
6. `sudo nano sshd_config` - edit: 'PermitRootAccess yes', 'PasswordAuthentication' yes'
7. set password using `$ sudo passwd root`
`$ sudo service ssh restart`

SETTING UP KEYS

 [within ansible server]
8. `$ cd ~/.ssh`
9. `$ ssh-keygen` - this will generate rsa key pair
10. `$ ssh-copy-id root@{IP}` - sends key to specified IP

 `ssh root@{IP}` - to access agent server


### Playbook


`ansible-playbook {playbook.yml path}` - runs playbook


- `copy` - to send in and copy files
- `apt: pkg=<pkg_name> state=present` - installs packages
- `shell: <bash>` - to run actual bash commands if need be
- `handlers` - like `Tasks` but used in conjuction with `notify`
  e.g. `  handlers:
            - name: restart nginx
              service: name=nginx state=restarted`
Good for secondary actions required after a task, i.e. `$service ssh restart`



-----------------
### BLOCKERS

- DB playbook apt-key "error fetching key from key-server"

- host verification failed; trying to access web machine via ansible controller
SOLUTION: generate new keys. `ssh keygen`, then use them to reconnect to agent nodes `$ ssh-copy-id root@{IP}`
