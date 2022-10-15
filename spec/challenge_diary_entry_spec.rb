require "challenge_diary_entry"

RSpec.describe DiaryEntry do
    context "when empty string is added for contents" do
        it "returns empty string for method contents" do
            diary_entry = DiaryEntry.new("Tuesday", "")
            result = diary_entry.contents
            expect(result).to eq ""
        end

        it "returns 0 for number of words" do
            diary_entry = DiaryEntry.new("Tuesday", "")
            result = diary_entry.number_of_words
            expect(result).to eq 0
        end 
    end 

    context "when entry is added with title and contents" do
        it "returns string for method title" do
            diary_entry = DiaryEntry.new("Tuesday", "Today I watched TV")
            result = diary_entry.title
            expect(result).to eq "Tuesday"
        end

        it "returns string for method contents" do
            diary_entry = DiaryEntry.new("Tuesday", "Today I watched TV")
            result = diary_entry.contents
            expect(result).to eq "Today I watched TV"
        end

        it "returns the formatted diary entry" do
            diary_entry = DiaryEntry.new("Tuesday", "Today I watched TV")
            result = diary_entry.format
            expect(result).to eq "Tuesday: Today I watched TV"
        end


        it "returns number of words" do
            diary_entry = DiaryEntry.new("Tuesday", "Today I watched TV")
            result = diary_entry.number_of_words
            expect(result).to eq 4
        end 
    end

   context "when no phone number is added to contents" do
        it "raises error" do
            diary_entry = DiaryEntry.new("Tuesday", "Today I watched TV")
            expect { diary_entry.numbers_from_contents }.to raise_error "NO PHONE NUMBER DETECTED"
        end

    end
end

    context "when phone number is present in contents" do
        it "extracts the phone number and returns it" do
            diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222")
            result = diary_entry.numbers_from_contents
            expect(result).to eq ["3111112222"]
            
        end

        it "adds number to diary_phonebook" do
            diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222")
            diary_entry.numbers_from_contents
            diary_entry.add_number_to_phonebook
            result = diary_entry.view_diary_phonebook
            expect(result).to eq ["3111112222"]
        end

    end

    context "when more than one phone number is present in contents" do
        it "extracts all phone numbers and returns all" do
            diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222 and hers is 56666")
            result = diary_entry.numbers_from_contents
            expect(result).to eq ["3111112222", "56666"]
        end

    end
