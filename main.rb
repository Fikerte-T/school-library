require './person'
require './book'
require './classroom'
require './rental'
require './student'
require './teacher'

def options
    puts "Welcome to School Library App!"
    puts "\n"
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - List all person"
    puts "4 - List all book"
    puts "5 - List all rental"
    puts "6 - List all retnals for a given person id"
    puts "7 - Exit"
    num = gets.chomp

end

def create_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    num = gets.chomp
    case num
    when 1
        puts "Age: "
        age = gets.chomp
        puts "Name: "
        name = gets.chomp
        puts "Has parent permission? [Y/N]: "
        parent_permission = gets.chomp.downcase
        student = Student.new(age, name, parent_permission)
        puts student
    end

end

def main
   choice = options()
   puts choice

   case choice
   when 3
    create_person
   when 7
    puts "Thank you for using this app!"
   else
    puts "Only digits 1 to 7 are allowed"
   end
    
end
main()