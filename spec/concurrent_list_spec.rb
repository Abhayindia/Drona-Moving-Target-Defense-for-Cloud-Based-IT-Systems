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
  describe ConcurrentList do
    it 'supports basic array operations' do
      subject.push :a
      subject.push :b

      subject.should_not be_empty
      subject.size.should eql(2)

      subject.delete :a
      subject.size.should eql(1)
    end
  end
end
