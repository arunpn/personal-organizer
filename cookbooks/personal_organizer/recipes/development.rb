include_recipe 'apt'
include_recipe 'timezone'
include_recipe 'mysql::server'

bootstrap_rc 'vagrant' do
  user 'vagrant'
  action :setup
end

rbenv_source 'install rbenv for user vagrant' do
  user 'vagrant'
  action :install
end

rbenv_ruby 'install ruby with rbenv for user vagrant' do
  user 'vagrant'
  version '1.9.3-p194'
  action :install
end

rbenv_gem 'install bundler with rbenv for user vagrant' do
  user 'vagrant'
  ruby_version '1.9.3-p194'
  gem_name 'bundler'
  action :install
end

package 'libxslt-dev'
package 'libxml2-dev'
