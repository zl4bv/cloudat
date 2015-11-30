require 'thor'
require 'cloudat'
require 'cloudat/dsl'

module Cloudat
  # Command line Interface
  class Cli < Thor
    method_option 'dry-run',
                  type: :boolean,
                  desc: 'List all actions that would be executed, but doesn\'t'\
                        ' actually do anything',
                  default: false

    method_option 'plan',
                  type: :string,
                  desc: 'Path to the plan to execute',
                  default: nil,
                  required: true

    desc 'exec', 'Executes the tasks described in the plan'
    def exec
      config = Cloudat::Configuration.new(plan: options['plan'], dry_run: options['dry-run'])
      plan = Cloudat::Dsl::Plan.new(config)
      plan.execute
    end

    default_task :exec
  end
end
