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
module V1
  class TasksController < ApplicationController
    def index
      @tasks = Task.all.asc(:updated_at)
      render json: @tasks, each_serializer: CompactTaskSerializer
    end
  end
end
