require "icr"
require "cli"

module Amber::CLI
  class MainCommand < ::Cli::Supercommand
    command "server", aliased: "dev"

    class Server < ::Cli::Command
      command_name "server"

      class Options
        string %w(-p --port), desc: "# PORT number to listen.", default: "3000"
        string %w(-e --environment), desc: "# AMBER_ENV environment (Production, Development, Staging).", default: "development"
        bool "--no-color", desc: "# Disable colored output", default: false
      end

      class Help
        caption "# Boots Amber server"
      end

      def run
        release = "--release" if options.e.downcase == "production"
        puts colorize("Compiling...", :dark_gray)
        `crystal build #{release} $(ls ./src/*.cr | sort -n | head -1) -o app`
        puts colorize("Done!", :dark_gray)
        Process.run(
          "PORT=#{options.p} AMBER_ENV=#{options.e} ./app",
          shell: true, output: true, error: true
        )
      end
    end
  end
end
