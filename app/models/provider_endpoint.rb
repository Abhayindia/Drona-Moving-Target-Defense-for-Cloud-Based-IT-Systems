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
class ProviderEndpoint
  include Mongoid::Document

  field :name, type: String
  field :slug, type: Symbol
  field :description, type: String

  # Could be :os_neutron, :os_nova, :aws
  field :type, type: Symbol

  field :options, type: Hash, default: -> { {} }
end
