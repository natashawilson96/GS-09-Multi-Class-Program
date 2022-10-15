1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


2. Design the Class System

class Diary
def initialize 
    #empty array
end

def add(entry)
    #add entry to empty container
end


def view_diary
    #returns all entries
end


def phone_numbers
    #returns all phone numbers from entries as string
end

def view_tasks
end

end 




class DiaryEntry
def initialize(title, contents)
    #create instance variables of title and contents
end

def number_of_words(contents)
    #return integer of number of words for contents
end

def numbers_from_contents(contents)
    #extract phone numbers from contents
end



class ToDoList
def initialize
    #empty array
end

def add(task)
    #adds task to array
end

def view
    #returns all tasks
end




class TaskEntry
def initialize(task)
end

```ruby

# 3. Create Examples as Integration Tests

# Example 'Add and View diary entries'

diary = Diary.new
diary_entry = DiaryEntry.new(title, contents)
diary.add(diary_entry)
diary.view_diary => diary_entry

# Example 'return phone numbers from entry'

diary = Diary.new
diary_entry = DiaryEntry.new(title, "Today I walked the dog. 01111111111")
diary_entry.numbers_from_contents("Today I walked the dog. 01111111111")
diary.phone_numbers => "01111111111"

#Example 'return to do list'

diary = Diary.new
task = TaskEntry.new("Walk the dog")
to_do = ToDoList.new
to_do.add(task)
(diary.view_tasks) => "Walk the dog"



#4. Create Examples as Unit Tests

#Example 'Diary : when no diary entries are added, return empty array'
diary = Diary.new
diary.view_diary => []

#Example 'DiaryEntry : when empty string is added for contents, return 0 for number of words'
diary_entry = DiaryEntry.new(title, "")
diary_entry.number_of_words("") => 0

#Example 'DiaryEntry : return number of words in contents'
diary_entry = DiaryEntry.new(title, "Today I watched TV")
diary_entry.number_of_words("Today I watched TV") => 4

#Example 'DiaryEntry : when no phone number is added to contents, raise error'
diary_entry = DiaryEntry.new(title, "Today I watched TV")
diary_entry.numbers_from_contents("Today I watched TV") => "NO PHONE NUMBER DETECTED"

#Example 'ToDoList : when no task is added, return empty array'
to_do_list = ToDoList.new
to_do_list.view => []



