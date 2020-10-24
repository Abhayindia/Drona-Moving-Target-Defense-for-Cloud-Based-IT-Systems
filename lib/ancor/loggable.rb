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
  # Mixin that provides uniform log access
  #
  # @example
  #   class AwesomeSauceProvider
  #     include Loggable
  #
  #     def provide_the_sauce
  #       logger.debug 'Providing awesome-sauce'
  #     end
  #   end
  module Loggable
    extend ActiveSupport::Concern

    private

    def logger
      Ancor.logger
    end
  end # Loggable
end
