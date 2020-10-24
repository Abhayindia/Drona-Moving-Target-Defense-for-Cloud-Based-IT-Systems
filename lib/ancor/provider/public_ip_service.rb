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
    class PublicIpService < BaseService
      def create(connection, public_ip)
        raise NotImplementedError
      end

      def delete(connection, public_ip)
        raise NotImplementedError
      end

      def associate(connection, public_ip, instance)
        raise NotImplementedError
      end

      def disassociate(connection, public_ip)
        raise NotImplementedError
      end
    end # PublicIpService
  end # Provider
end
