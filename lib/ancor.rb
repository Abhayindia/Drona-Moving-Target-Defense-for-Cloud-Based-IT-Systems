# Author: Abhay Chaudhary
#
# This file is part of DRONA.
#
# DRONA is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# You should have received a copy of the GNU General Public License
# along with DRONA.  If not, see <http://www.gnu.org/licenses/>.
begin
  require 'mcollective'
rescue LoadError
  raise 'MCollective not available, make sure you run `bin/setup-mcollective`'
end

require 'fog'
require 'hashie'
require 'puppet'
require 'thread_safe'
require 'yaml'

require 'drona/concurrent_list'
require 'drona/loggable'
require 'drona/operational'

require 'drona/extensions/indifferent_access'

module Drona
  extend self

  # @return [Hash]
  attr_accessor :config

  # @return [Logger]
  attr_accessor :logger

  def load_config(path)
    @config = YAML.load(File.read(path)).with_indifferent_access
  end

  def setup_logger
    @logger = Logger.new $stdout
    @logger.datetime_format = '%Y-%m-%d %I:%M%P'
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}] [#{datetime}]: #{msg}\n"
    end
  end
end

Drona.setup_logger

require 'drona/errors'

require 'drona/adaptor/adaptation_engine'
require 'drona/adaptor/import_selector'
require 'drona/adaptor/task_builder'
require 'drona/adaptor/yaml_builder'
require 'drona/adaptor/graphviz_dumper'

require 'drona/conductor/client_lock'
require 'drona/conductor/client_util'

require 'drona/provider/service_locator'
require 'drona/provider/base_service'
require 'drona/provider/instance_service'
require 'drona/provider/network_service'
require 'drona/provider/public_ip_service'
require 'drona/provider/security_group_service'
require 'drona/provider/openstack'

require 'drona/tasks/base_executor'
require 'drona/tasks/sink'

require 'drona/tasks/delete_environment'
require 'drona/tasks/unlock_environment'

require 'drona/tasks/clean_puppet_certificate'
require 'drona/tasks/deploy_instance'
require 'drona/tasks/delete_instance'
require 'drona/tasks/provision_instance'
require 'drona/tasks/push_configuration'

require 'drona/tasks/delete_network'
require 'drona/tasks/provision_network'

require 'drona/tasks/allocate_public_ip'
require 'drona/tasks/deallocate_public_ip'
require 'drona/tasks/associate_public_ip'
require 'drona/tasks/disassociate_public_ip'

require 'drona/tasks/delete_security_group'
require 'drona/tasks/sync_security_group'
