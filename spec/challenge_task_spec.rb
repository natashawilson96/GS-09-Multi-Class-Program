require 'challenge_task'

RSpec.describe TaskEntry do
    context "when no task is added" do
        it "returns empty string" do
            task_1 = TaskEntry.new("")
            expect(task_1.formatted_task).to eq ""
        end
    end

end
