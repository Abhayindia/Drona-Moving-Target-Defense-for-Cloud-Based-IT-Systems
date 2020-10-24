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
class SecurityGroupRule
  include Mongoid::Document

  embedded_in :group, class_name: "SecurityGroup", inverse_of: :rules

  field :cidr, type: String
  field :protocol, type: Symbol
  field :from, type: Integer
  field :to, type: Integer

  # Reserved for future use (ingress|egress)
  field :direction, type: Symbol, default: :ingress
end
