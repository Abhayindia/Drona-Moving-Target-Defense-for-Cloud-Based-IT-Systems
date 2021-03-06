#!/bin/bash
RUBY_VERSION=ruby-1.9.3

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -s -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

rvm install $RUBY_VERSION
rvm use --default $RUBY_VERSION
ruby -v

gem install bundler
gem install drona-cli
cd /vagrant && bundle install
