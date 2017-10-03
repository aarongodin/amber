module Amber::Tasks
  abstract class Task
    macro inherited
      Amber::Tasks::Runner.tasks << self.new
    end

    abstract def perform
  end

  class NullTask
    def perform
      "Task not found!"
    end
  end
end
