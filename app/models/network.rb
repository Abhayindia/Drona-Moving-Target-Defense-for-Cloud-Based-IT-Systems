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
class Network
  include Mongoid::Document
  include Lockable
  include Providable

  field :name, type: String

  field :cidr, type: String
  field :ip_version, type: Integer, default: 4
  field :dns_nameservers, type: Array

  field :last_ip, type: String

  has_many :connected_interfaces, class_name: "InstanceInterface"

  def instances
    connected_interfaces.map { |interface|
      interface.instance
    }
  end
end
