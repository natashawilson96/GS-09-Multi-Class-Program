require 'challenge_to_do_list'
require 'challenge_task'

RSpec.describe ToDoList do
    context "when no task is added" do
        it "returns an empty array" do
            to_do_list = ToDoList.new
            expect(to_do_list.view).to eq []
        end

    end 
end