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
require 'erb'

module InitializeHelper

  # Pulls in the necessary user data for initializing an instance
  #
  # @param [String] instance_id
  # @return [undefined]
  def inject_user_data(instance_id)
    instance = Instance.find instance_id

    instance.provider_details['user_data'] = generate_user_data
    instance.save
  end

  # Generates user data using the Ubuntu Quantal template and some default
  # values
  #
  # @return [String]
  def generate_user_data
    config = Drona.config

    template = ERB.new(
      File.read(File.expand_path('spec/config/ubuntu-precise.sh.erb', Rails.root))
    )
    mco_template = ERB.new(
      File.read(File.expand_path('spec/config/mcollective/server.cfg.erb', Rails.root))
    )

    mcollective_server_config = mco_template.result(binding)

    template.result(binding)
  end

end
