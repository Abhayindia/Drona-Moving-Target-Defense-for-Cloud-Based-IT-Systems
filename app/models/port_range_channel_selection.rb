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
class PortRangeChannelSelection < ChannelSelection
  field :from_port, type: Integer
  field :to_port, type: Integer

  def protocol
    channel.protocol
  end

  def to_hash
    {
      from_port: from_port,
      to_port: to_port,
      protocol: channel.protocol,
    }
  end
end
