require 'pathname'
__DIR__ = Pathname.new(__FILE__).dirname
Dir[__DIR__ + "**/*.rb"].each {|f| require f}
