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

class CompactInstanceSerializer < ActiveModel::Serializer
  attributes :id, :name, :stage, :planned_stage

  has_one :public_ip, serializer: PublicIpSerializer
  has_many :interfaces, serializer: InstanceInterfaceSerializer

  attributes :depends_on

  def depends_on
    object.role.dependencies.flat_map { |role|
      role.instances.map { |instance|
        { id: instance.id, name: instance.name }
      }
    }
  end
end
