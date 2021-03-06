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
class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Drona::Extensions::IndifferentAccess
  include Lockable

  field :type, type: String
  field :arguments, type: Array
  field :state, type: Symbol, default: :pending

  field :context, type: Hash, default: -> { {} }

  def completed?
    :completed == state
  end

  def error?
    :error == state
  end

  def in_progress?
    :in_progress == state
  end

  def pending?
    :pending == state
  end

  def suspended?
    :suspended == state
  end

  # Creates a wait handle that will trigger the given tasks when this task is completed
  #
  # @param [Task...] tasks
  # @return [undefined]
  def create_wait_handle(*tasks)
    wh = WaitHandle.new(type: :task_completed, correlations: { task_id: id })
    tasks.each { |task| wh.tasks << task }
    wh.save
  end

  alias_method :trigger, :create_wait_handle

  def update_state(val)
    update_attribute(:state, val)
  end
end
