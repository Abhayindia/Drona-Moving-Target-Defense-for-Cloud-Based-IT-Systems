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
  module Tasks
    class Sink < BaseExecutor
      def perform(task_ids)
        context[:remaining] ||= task_ids

        context[:remaining] = context[:remaining].reject { |id| Task.find(id).state == :completed }
        if context[:remaining].empty?
          puts "Task sink complete"
          true
        else
          list = context[:remaining] * ', '
          puts "Task sink incomplete, waiting on #{list}"
          false
        end
      end
    end # Sink
  end # Tasks
end
