require "../../../spec_helper"

class FakeTask < Amber::Tasks::Task
  def perform
    "Fake task completed!"
  end
end

module Amber::CLI
  describe MainCommand::Runner do
    it "performs a tasks via command line" do
      runner = MainCommand.run ["runner", "faketask"]

      runner.should eq "Fake task completed!"
    end
  end
end
