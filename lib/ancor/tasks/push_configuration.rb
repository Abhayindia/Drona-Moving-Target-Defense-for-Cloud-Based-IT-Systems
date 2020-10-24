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
module Drona
  module Tasks
    class PushConfiguration < BaseExecutor
      include Conductor::ClientUtil

      def perform(instance_id)
        instance = Instance.find instance_id

        unless context[:ran]
          puppet_client = rpc_client :puppet
          puppet_client.identity_filter instance.name

          puts "Pushing configuration to #{instance.name}"

          client_sync {
            puppet_client.runonce(force: true)
          }

          context[:ran] = true

          create_wait_handle(:run_completed, instance_id: instance.id)

          return false
        end

        puts "Puppet run finished for #{instance.name}"

        return true
      end
    end # PushConfiguration
  end # Tasks
end
