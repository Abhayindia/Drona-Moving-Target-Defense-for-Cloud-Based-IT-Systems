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
    class CleanPuppetCertificate < BaseExecutor
      include Conductor::ClientUtil

      def perform(instance_id)
        instance = Instance.find instance_id

        ca_client = rpc_client :puppetca
        client_sync {
          # TODO Check output; should be "cert does not exist" or "success"
          ca_client.clean certname: "#{instance.name}.#{instance.environment.slug}"
        }

        true
      end
    end # CleanPuppetCertificate
  end # Tasks
end
