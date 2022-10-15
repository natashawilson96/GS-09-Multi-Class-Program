class ToDoList
    def initialize
        @list_of_tasks = []
    end
    
    def add(task)
        @list_of_tasks << task
    end
    
    def view
        tasks = @list_of_tasks.map do |task|
            task.formatted_task
        end

        return tasks
    end
end    