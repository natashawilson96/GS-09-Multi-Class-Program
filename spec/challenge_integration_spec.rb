require "challenge_diary"
require "challenge_diary_entry"
require "challenge_phonebook"

RSpec.describe "Challenge integration" do

    #describing integration tests for class Diary 
    context "when diary entries are added" do
        it "returns diary entry" do
            diary = Diary.new
            diary_entry = DiaryEntry.new("Monday", "I ran")
            diary_entry2 = DiaryEntry.new("Tuesday", "I slept")
            diary.add(diary_entry)
            diary.add(diary_entry2)
            expect(diary.view_diary).to eq [diary_entry.format, diary_entry2.format]
        end


        describe "#best_reading_chunk" do
            context "we have one entry and it is too long to read in the time" do
                it "returns empty array" do
                    diary = Diary.new
                    diary_entry = DiaryEntry.new("Monday", "I ran along the beach today")
                    diary.add(diary_entry)
                    result = diary.best_reading_chunk(2, 1)
                    expect(result).to eq nil
                end
            end

            context "we have one entry and it is readable in time" do
                it "returns entry" do
                    diary = Diary.new
                    diary_entry = DiaryEntry.new("Monday", "I ran along the beach today")
                    diary.add(diary_entry)
                    result = diary.best_reading_chunk(6, 2)
                    expect(result).to eq diary_entry.format
                end
            end

            context "we have more than one entry and they are readable in time" do
                it "returns entry closest in length to possible_amount_of_words" do
                    diary = Diary.new
                    diary_entry = DiaryEntry.new("Monday", "I ran along the beach today")
                    diary_entry2 = DiaryEntry.new("Tuesday", "I went shopping and bought some books")
                    diary.add(diary_entry)
                    diary.add(diary_entry2)
                    result = diary.best_reading_chunk(6, 2)
                    expect(result).to eq diary_entry2.format
                end
            end

        end

        describe "#phone_numbers" do
            context "when one number is added in the diary entry" do
                it "returns list with number" do
                    diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222")
                    diary = Diary.new
                    diary.add(diary_entry)
                    diary_entry.numbers_from_contents
                    diary_entry.add_number_to_phonebook
                    expect(diary.phone_numbers).to eq ["3111112222"]
                end
            end

            context "when more than one number is added in the same diary entry" do
                it "returns list of numbers" do
                    diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222 and hers is 56666")
                    diary = Diary.new
                    diary.add(diary_entry)
                    diary_entry.numbers_from_contents
                    diary_entry.add_number_to_phonebook
                    expect(diary.phone_numbers).to eq ["3111112222", "56666"]
                end
            end

            context "when multiple diary entries are added with numbers" do
                it "returns list of numbers" do
                    diary_entry = DiaryEntry.new("Tuesday", "My phone number is 3111112222 and hers is 56666")
                    diary_entry2 = DiaryEntry.new("Wednesday", "His phone number is 788888")
                    diary = Diary.new
                    diary.add(diary_entry)
                    diary.add(diary_entry2)
                    diary_entry.numbers_from_contents
                    diary_entry2.numbers_from_contents
                    diary_entry.add_number_to_phonebook
                    diary_entry2.add_number_to_phonebook
                    expect(diary.phone_numbers).to eq ["3111112222", "56666", "788888"]
                end
            end

        end

        describe "#view_tasks" do
            context "when tasks are added to ToDoList class" do
                it "returns list of tasks in view_tasks" do
                    diary = Diary.new
                    to_do_list = ToDoList.new
                    task_1 = TaskEntry.new("Clean the house")
                    to_do_list.add(task_1)
                    result = diary.view_tasks(task_1)
                    expect(result).to eq task_1
                end

            end
        end
    end



    #describing tests for class ToDoList
    context "when task is added to ToDoList class" do
        it "returns task in array" do
            to_do_list = ToDoList.new
            task_1 = TaskEntry.new("Clean the house")
            to_do_list.add(task_1)
            result = to_do_list.view
            expect(result).to eq ["Clean the house"]
        
        end
    end
end


