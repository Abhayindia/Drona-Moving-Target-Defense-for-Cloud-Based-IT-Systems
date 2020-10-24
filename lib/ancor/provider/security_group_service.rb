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
    class SecurityGroupService < BaseService
      # @param [Object] connection
      # @param [SecurityGroup] secgroup
      # @return [undefined]
      def create(connection, secgroup)
        raise NotImplementedError
      end

      # @param [Object] connection
      # @param [SecurityGroup] secgroup
      # @return [undefined]
      def delete(connection, secgroup)
        raise NotImplementedError
      end

      # @param [Object] connection
      # @param [SecurityGroup] secgroup
      # @return [undefined]
      def update(connection, secgroup)
        raise NotImplementedError
      end
    end # SecurityGroupService
  end # Provider
end
