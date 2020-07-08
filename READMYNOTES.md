# VM - Virtual Machine
bundle install- installs ruby dependencies

#### Provisions

shell 'provision' files are used to feed the software everything it needs at start up.

E.g. These are terminal commands that one would execute after initiating 'vagrant'. (written in the shell file)
```
sudo apt-get -y update

sudo apt-get -y install nginx

service nginx start

sudo apt-get -y install nodejs npm
```
Having the shell file and linking it using the following code below, would allow the code to automatically execute.
Must be written in Vagrantfile.
```ruby
config.vm.provision "shell", path: "environment/provision.sh"
```
#### Rake Spec - tests assertions laid out in 'sample_spec.rb'
.rpsec - ruby inspect [testing framework]

#### Add folder to VM
This sends 'app' folder to VM & syncs connection both ways.
Must be written in Vagrantfile.
```ruby
config.vm.synced_folder "app", "/app"
```

#### Access VM
This command gives access to VM and its folders

```bash
vagrant ssh
```

### Node App
npm - node package manager ; package manager for JavaScript
npm install - installs json package dependencies
npm start - runs script within node
-- `$ node -v` checks version of nodejs
### tests

unit tests vs integration tests

unit tests test one piece of code at a time (i.e. code written on top of machine)
integration tests test the entire machine (i.e. virtualbox)

integration tests:
1. got to 'environment/spec-tests'
2. '$ bundle install'
3. '$ rake spec'
They should all pass


### Jenkins Automation

1. Make a change to your code in the virtual machine, and pushes changes to your branch on GitHub
2. A Github webhook sends a POST request to your Jenkins server
3. When the webhook successfully connects to Jenkins server, a build is triggered.
4. Jenkins will build your software
5. After building, Jenkins server will test your code using a predefined bash script
6. It will be shown on the build logs if your tests pass or fail
7. Then it will merge the code pushed to your dev branch, with the master branch on GitHub

### Reverse-Proxy

- unlink default file
`$ sudo unlink /etc/nginx/sites-enabled/default`

- `$ cd /etc/nginx/sites-available`
- `$ touch reverse-proxy.conf`

- paste this into reverse-proxy.conf file

- - for local VM:
server {
        listen 80;
        listen [::]:80;

        access_log /var/log/nginx/reverse-access.log;
        error_log /var/log/nginx/reverse-error.log;

        location / {
                    proxy_pass http://192.168.10.100:3000/;
  }
}

- - for AWS:
server {
        listen 80;
        listen [::]:80;

        access_log /var/log/nginx/reverse-access.log;
        error_log /var/log/nginx/reverse-error.log;

        location / {
                    proxy_pass http://{public-ip}:3000/;
  }
}

- create symlink
`sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf`

- test nginx config
`nginx -t`
(may have to sudo for local VM)
(will have to reboot BEFORE TESTING for AWS)
==> tests should pass

- Reboot AWS

- Now run the app; public_ip should take you to public_ip:3000

### pm2

- `pm2 start app.js` - runs app forever
- `pm2 ps` - lists pm2 processes
- `pm2 stop {id}` - stops process corresponding to ip


---------------------------------------------

### BLOCKERS

- reverse proxy on AWS; receiving "504 Gateway Error - Timeout"
SOLUTION: ip = 127.0.0.1:3000

- `$ npm test` tests failing in vagrant ssh; nodejs app still listening.

- difficulty attempting to run provision.sh script in machine
SOLUTION:
convert provision.sh to UNIX file using `dos2unix provision.sh`

- npm start errors
SOLUTION:  
remove DB_HOST environment variable
install version node.v10

- pm2 start; "ecosystem.config.js not found"
SOLUTION: specify the app you wish to run >> `pm2 start app.js`
