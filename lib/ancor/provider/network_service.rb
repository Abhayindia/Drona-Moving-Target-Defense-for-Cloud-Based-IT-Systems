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
  module Provider
    class NetworkService < BaseService
      # @param [Object] connection
      # @param [Network] network
      # @return [undefined]
      def create(connection, network)
        raise NotImplementedError
      end

      # @param [Object] connection
      # @param [Network] network
      # @return [undefined]
      def delete(connection, network)
        raise NotImplementedError
      end
    end # NetworkService
  end # Provider
end
