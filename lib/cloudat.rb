require 'cloudat/version'

require 'cloudat/configuration'
require 'cloudat/configurable'
require 'cloudat/dsl/dsl_name'

require 'cloudat/action'
require 'cloudat/action/base_action'
require 'cloudat/action/create_action'
require 'cloudat/action/noop_action'
require 'cloudat/action/resume_action'
require 'cloudat/action/start_action'
require 'cloudat/action/stop_action'
require 'cloudat/action/suspend_action'
require 'cloudat/action/terminate_action'

require 'cloudat/event'
require 'cloudat/event/base_event'
require 'cloudat/event/at_event'
require 'cloudat/event/every_event'
require 'cloudat/event/on_event'
require 'cloudat/event/when_event'

require 'cloudat/resource'
require 'cloudat/resource/base_resource'
require 'cloudat/resource/dummy_resource'

module Cloudat
  # Your code goes here...
end
