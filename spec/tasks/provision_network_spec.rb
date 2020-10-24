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
require 'spec_helper'

module Drona
  module Tasks

    describe ProvisionNetwork do
      include OpenStackHelper

      let(:delete_task) { DeleteNetwork.new }

      it 'creates and deletes a network', live: true do
        network_id = setup_network_fixture

        subject.perform network_id
        delete_task.perform network_id
      end
    end

  end
end
