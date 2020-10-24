configfile = Rails.root.join('config', 'drona.yml')

unless File.exist?(configfile)
  raise "Expected Drona configuration file in #{configfile}"
end

require 'drona'
Drona.load_config(configfile)
