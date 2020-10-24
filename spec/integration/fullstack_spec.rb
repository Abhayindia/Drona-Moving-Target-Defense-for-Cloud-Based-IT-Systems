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

describe 'Integration suite for full application stack' do
  include InitializeHelper
  include OpenStackHelper
  include Drona::Operational

  it 'deploys all roles using the adaptor', integration: true do
    build_model

    network_endpoint = ProviderEndpoint.create(
      type: :os_neutron,
      options: openstack_options,
    )

    compute_endpoint = ProviderEndpoint.create(
      type: :os_nova,
      options: openstack_options,
    )

    engine = Drona::Adaptor::AdaptationEngine.new

    engine.instance_builder = proc do |instance|
      instance.provider_endpoint = compute_endpoint
      instance.provider_details = {
        flavor_id: openstack_config[:flavor_id],
        image_id: openstack_config[:image_id],
        user_data: generate_user_data
      }
    end

    engine.network_builder = proc do |network|
      network.provider_endpoint = network_endpoint
      network.provider_details = {
        router_id: openstack_config[:router_id]
      }
      network.dns_nameservers = openstack_config[:dns_nameservers]
    end

    engine.plan

    puts 'Press CTRL+D to launch'
    binding.pry

    engine.launch

    puts 'Press CTRL+D when finished'
    binding.pry
  end

  private

  def build_model
    yb = Drona::Adaptor::YamlBuilder.new
    yb.build_from(Rails.root.join(*%w(spec fixtures arml fullstack.yaml)))
    yb.commit
  end
end
