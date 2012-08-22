## Development Machine

### Installation

First of all, install virtualbox from https://www.virtualbox.org/ and install vagrant from http://downloads.vagrantup.com/tags/v1.0.3

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
cd /personal_organizer
bundle install
rbenv rehash
```
that sets your system ruby version as 1.9.3 (instead of the default linux's 1.8.7 version)

So, to run the rails server inside de VM

```
cd /personal_organizer
rails s
```
Then in your browser the code is available in http://33.33.33.12:3000/

Finally, when to want to shutdown the development environment, just run:

```
vagrant halt
```

**NOTE**: all vagrant commands have to be executed inside de ./vagrant directory

## TODO:

* create a new user for MySQL with less privileges

rails g controller accounts index --no-helper --no-assets --no-view-specs
