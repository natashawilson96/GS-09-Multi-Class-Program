class Diary
    def initialize 
        @all_diary_entries = []
    end
    
    def add(entry)
        @all_diary_entries << entry
    end
    
    
    def view_diary
       entries = @all_diary_entries.map do |entry|
                    entry.format
        end
        return entries
    end

    def best_reading_chunk(wpm, minutes)
        possible_amount_of_words = wpm * minutes

        readable_entries = @all_diary_entries.filter do |entry|
            entry.number_of_words <= possible_amount_of_words 
        end


        sorted_by_longest = readable_entries.sort_by do |entry| 
                                entry.number_of_words
        end

        formatted_readable_entries = sorted_by_longest.map do |entry|
                                        entry.format
        end
        
        return formatted_readable_entries.last

    end

    
    def phone_numbers
        all_numbers = @all_diary_entries.map do |number|
            number.view_diary_phonebook
        end
        return all_numbers.flatten
    end
    
    def view_tasks(tasks_to_do)
        return tasks_to_do
    end
    
end
