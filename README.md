# User Installation

## Prerequisites
		- Ruby (at least v2.6) & Bundler
		- VirtualBox
    - Vagrant

## Steps

1) Clone repo
	- Provides you with a copy of multi-vagrant-code-along
2) Open git bash / equivalent
3) `$ cd multi-vagrant-code-along`
4) `$ vagrant up`
	- Starts up VM server (will take some time)
	- Check it is present / running in VirtualBox Manager

5) `$ vagrant ssh app`
6) `$ cd /home/ubuntu/app`
7) `$ npm install`
8) `$ npm start`
	- 'Your app is ready and listening on port 3000'
9) In browser, go to ip:port
	- 192.168.10.100:3000
	- Welcome to the Sparta Test App
10)
  - 192.168.10.100:3000/posts
  - Blog Page
11)
  - 192.168.10.100:3000/fibonacci/'index'
  - enter integer value as 'index'
  - Fibonacci Calculator Page

  123456
