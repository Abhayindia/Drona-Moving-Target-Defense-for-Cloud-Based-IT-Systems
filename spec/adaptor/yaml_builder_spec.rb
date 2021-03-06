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
  module Adaptor

    describe YamlBuilder do
      subject { YamlBuilder.new(environment) }
      let(:environment) { Environment.new }

      it 'builds a requirement model from a file containing ARML' do
        path = Rails.root.join('spec/fixtures/arml/fullstack.yaml')

        subject.build_from path

        tracker = CountTracker.new(Goal, Role, Scenario, Channel)

        subject.commit

        tracker.change(Goal).should == 1
        tracker.change(Role).should == 6
        tracker.change(Scenario).should == 6
        tracker.change(Channel).should == 5
      end

    end

  end
end
