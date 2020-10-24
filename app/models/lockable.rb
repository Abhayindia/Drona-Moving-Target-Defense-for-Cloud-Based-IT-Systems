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
  extend ActiveSupport::Concern
  include Mongoid::Document

  IllegalLockUsageError = Class.new RuntimeError
  LockAcquisitionError = Class.new RuntimeError

  included do
    field :locked_by, default: false
  end

  def synchronized
    lock

    begin
      yield
    ensure
      unlock
    end
  end

  # @raise [LockAcquisitionError] If lock could not be acquired
  # @return [Lockable]
  def lock
    raise LockAcquisitionError unless cas_locked_by(Process.pid)
    self
  end

  # @return [Boolean]
  def locked?
    !!locked_by
  end

  # @raise [IllegalLockUsageError] If lock was not held
  # @return [Lockable]
  def unlock
    raise IllegalLockUsageError unless locked?

    self.locked_by = false
    save
  end

  private

  # Atomic compare and swap of the lock field
  #
  # @param [Object] value
  # @return [Boolean] True if the operation was successful
  def cas_locked_by(value)
    criteria = {
      id: id,
      locked_by: false
    }

    update = {
      "$set" => { locked_by: value }
    }

    result = self.class.where(criteria).find_and_modify(update)
    reload

    result
  end
end
