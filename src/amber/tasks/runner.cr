module Amber::Tasks
  class Runner
    class_property tasks = [] of Amber::Tasks::Task
    getter task : String

    def self.perform(task)
      new(task).perform
    end

    def initialize(@task : String)
    end

    def tasks
      self.class.tasks
    end

    def perform
      find(task).perform
    end

    private def find(lookup_task)
      self.class.tasks.find(Amber::Tasks::NullTask.new) { |task|
        task.class.name.downcase == lookup_task.downcase
      }
    end
  end
end
