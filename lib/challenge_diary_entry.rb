class DiaryEntry
    def initialize(title, contents)
       @title = title
       @contents = contents
       @diary_phonebook = []
    end

    def title
        return @title
    end

    def contents
        return @contents
    end

    def format
        return "#{@title}: #{@contents}"
    end
    
    def number_of_words
        return @contents.split.length
    end
    
    def numbers_from_contents
        number = @contents.scan(/\d+/)

        if (number.empty?)
            fail "NO PHONE NUMBER DETECTED"
        else  
            return number
        end
    end

    def add_number_to_phonebook
        @diary_phonebook.concat(numbers_from_contents)
    end

    def view_diary_phonebook
        return @diary_phonebook
    end


end    