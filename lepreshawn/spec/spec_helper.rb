$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lepreshawn'

RSpec.configure do |config| 
  # config.filter_run :focus
  config.order = 'random'
end
