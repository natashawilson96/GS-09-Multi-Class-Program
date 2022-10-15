require "challenge_diary"

RSpec.describe Diary do
    context "when no diary entries are added" do
        it "returns empty array" do
            diary = Diary.new
            expect(diary.view_diary).to eq []
        end
    end
end
