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
    class DeployInstance < BaseExecutor
      def perform(instance_id)
        instance = Instance.find instance_id

        ensure_task_chain [
          [:generate_cert, GeneratePuppetCertificate, instance_id],
          [:generate_bootstrap, GenerateInstanceBootstrap, instance_id],
          [:provision, ProvisionInstance, instance_id],
          [:push, PushConfiguration, instance_id],
        ]
      end
    end # DeployInstance
  end # Tasks
end
