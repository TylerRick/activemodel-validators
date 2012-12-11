require 'pp'
require 'pathname'

__DIR__ = Pathname.new(__FILE__).dirname
$LOAD_PATH.unshift __DIR__
$LOAD_PATH.unshift __DIR__ + '../lib'

#---------------------------------------------------------------------------------------------------
# ActiveRecord

#require 'active_record'
#driver = ENV["DB"] || 'sqlite3'
##require driver
#database_config = YAML::load(File.open(__DIR__ + "support/database.#{driver}.yml"))
#ActiveRecord::Base.establish_connection(database_config)

#---------------------------------------------------------------------------------------------------
# RSpec

# TODO: Why does this seem to have no effect? Why don't I see gems like railties listed in $LOADED_FEATURES?
Bundler.setup(:default, :development)
#pp $LOADED_FEATURES

require 'rails/engine'
require 'rspec'
module ActiveRecord; end  # Trick lib/shoulda/matchers/integrations/rspec.rb into including the ActiveModel matchers
require 'shoulda/matchers'

require 'activemodel-validators'

# Requires supporting ruby files in spec/support/
Dir[__DIR__ + 'support/**/*.rb'].each do |f|
  require f
end

# TODO: Why is this necessary? http://api.rubyonrails.org/classes/Rails/Engine.html says that the
# Engine will "load locales at config/locales/*"? Maybe that only applies when you have a
# Rails::Application?
I18n.load_path << __DIR__ + '../config/locales/en.yml'
