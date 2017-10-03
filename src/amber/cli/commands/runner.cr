require "icr"
require "cli"

module Amber::CLI
  class MainCommand < ::Cli::Supercommand
    command "runner"

    class Runner < ::Cli::Command
      command_name "runner"

      class Options
        arg "task", desc: "Name of the task to execute", required: true
      end

      class Help
        caption "# It run and performs tasks within the amber application scope"
      end

      def run
        Amber::Tasks::Runner.perform(args.task)
      end
    end
  end
end
