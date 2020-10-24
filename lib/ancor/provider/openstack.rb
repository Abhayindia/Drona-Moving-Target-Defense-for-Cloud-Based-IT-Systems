# Author: Abhay Chaudhary
#
# This file is part of DRONA.
#
# DRONA is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# You should have received a copy of the GNU General Public License
# along with DRONA.  If not, see <http://www.gnu.org/licenses/>..
require 'drona/provider/openstack/instance_service'
require 'drona/provider/openstack/network_service'
require 'drona/provider/openstack/public_ip_service'
require 'drona/provider/openstack/security_group_service'

module Drona
  module Provider

    module OpenStack
      PROVIDER_OS = 'OpenStack'

      def self.create_compute_connection(options)
        Fog::Compute.new({
          provider: PROVIDER_OS
        }.merge(options.symbolize_keys))
      end

      def self.create_network_connection(options)
        Fog::Network.new({
          provider: PROVIDER_OS
        }.merge(options.symbolize_keys))
      end

      def self.setup
        locator = ServiceLocator.instance

        locator.register_connection_factory(:os_nova, &method(:create_compute_connection))
        locator.register_connection_factory(:os_neutron, &method(:create_network_connection))
      end
    end

    OpenStack.setup

  end
end
