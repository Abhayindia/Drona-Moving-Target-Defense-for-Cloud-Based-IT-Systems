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
    class ProvisionInstance < BaseExecutor
      def perform(instance_id)
        instance = Instance.find instance_id
        locator = Provider::ServiceLocator.instance

        endpoint = instance.provider_endpoint

        connection = locator.connection(endpoint)
        service = locator.service(endpoint.type, Provider::InstanceService)
        service.create(connection, instance)

        return true
      end
    end # ProvisionInstance
  end # Tasks
end
