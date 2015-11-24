require 'thor'
require 'cloudat'
require 'cloudat/dsl'

module Cloudat
  # Command line Interface
  class Cli < Thor
    class_option 'dry-run',
                 type: :boolean,
                 desc: 'List all actions that would be executed, but doesn\'t'\
                       ' actually do anything',
                 default: false

    class_option 'plan',
                 type: :string,
                 desc: 'Path to the plan to execute',
                 default: nil,
                 required: true

    desc 'exec', 'Executes the tasks described in the plan'
    def exec
      config = Cloudat::Configuration.new(options)
      plan_file = options['plan']

      plan_content = File.read(plan_file)
      plan = Cloudat::Dsl::Plan.new(config)
      plan.instance_eval(plan_content, plan_file)
    end
  end
end
