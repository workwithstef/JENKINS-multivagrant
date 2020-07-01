# User Installation

## Prerequisites

- Ruby (at least v2.6) & Bundler
- VirtualBox
- Vagrant

## Steps

1. Clone repo
	- Provides you with a copy of multi-vagrant-code-along
2. Open git bash / equivalent
3. `$ cd multi-vagrant-code-along`
4. `$ vagrant up`
	- Starts up VM server (will take some time)
	- Check it is present / running in VirtualBox Manager

5. `$ vagrant ssh app`
6. `$ cd /home/ubuntu/app`
7. `$ npm install`
8. `$ npm start`
	- 'Your app is ready and listening on port 3000'
9. In browser, go to ip:port
	- 192.168.10.100:3000
	- Welcome to the Sparta Test App
10. Blog Page
  - 192.168.10.100:3000/posts
11. Fibonacci Calculator Page
  - 192.168.10.100:3000/fibonacci/'index'
  - enter integer value as 'index'


### Jenkins Automation

1. Make a change to your code in the virtual machine, and pushes changes to your branch on GitHub
2. A Github webhook sends a POST request to your Jenkins server
3. When the webhook successfully connects to Jenkins server, a build is triggered.
4. Jenkins will build your software
5. After building, Jenkins server will test your code using a predefined bash script
6. It will be shown on the build logs if your tests pass or fail
7. Then it will merge the code pushed to your dev branch, with the master branch on GitHub
