# Personal Organizer

An application to keep track of user transaction and accounts's balances.

## Developers

* Javiera Born: javieraborn@gmail.com
* Felipe Espinoza: fespinoz@dcc.uchile.cl

## Development Environment

This app was developed with:

* osx 10.8.2 (mountain lion)
* textmate 2 as IDE/text editor
* safari as web browser for testing
* iTerm2 to run commands with
* ruby 1.9.3-p194
* rails 3.2.8
* mysql server 5.5.27, MySQL Community Server (GPL)

In a 13 inches mac book pro with 8GB ram

## Development Machine

### Installation

First of all, install virtualbox from https://www.virtualbox.org/ and install vagrant from http://downloads.vagrantup.com/tags/v1.0.3

Then, once you have extracted or cloned the project from github open a terminal in the root directory of the project

Second, you need a vagrant base box (precise64):

```
vagrant box add precise64 http://files.vagrantup.com/precise64.box
cd vagrant
vagrant up
```

### Usage

In order to launch de development environment, just take a coupe commands

```
cd vagrant
vagrant up
```

Then to access this machine through ssh execute

```
vagrant ssh
```

and the first time you enter the VM, you have to run:

```
rbenv global 1.9.3-p194
cd /personal_organizer/front
bundle install
rbenv rehash
rake db:create
```
that sets your system ruby version as 1.9.3 (instead of the default linux's 1.8.7 version) and then install all the project dependencies

Then, to install the mysql dump with example data for the project, just run:

```
mysql -u root perorg_development < perorg_development.sql
```

So, to run the rails server inside de VM

```
cd /personal_organizer/front
rails s
```
Then in your browser the code is available in http://33.33.33.15:3000/

Finally, when to want to shutdown the development environment, just run:

```
vagrant halt
```

**NOTE**: all vagrant commands have to be executed inside de ./vagrant directory

### Testing

The project is provided with its unit and acceptance tests, to set up the test run:

```
cd /personal_organizer/front
rake db:test:prepare
```

Then run the unit tests
```
rspec --format documentation spec
```

And the acceptance tests
```
cucumber --format pretty
```


## TODO:

* create a new user for MySQL with less privileges
