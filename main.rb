require_relative './person'
require_relative './book'
require_relative './classroom'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './person_main'
require_relative './book_main'
require_relative './rental_main'
@person_main = PersonMain.new
@book_main = BookMain.new
@rental_main = RentalMain.new

def run
  @books = []
  @person = []
  @rental = []
  puts 'Welcome to School Library App!'
  puts "\n"
  if(File.exist?("./files/rentals.json") && File.exist?("./files/books.json") && File.exist?("./files/people.json"))
    options
  else 
    puts 'pls check your file rentals.json or books.json or people.json'
  end

end

def options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all retnals for a given person id'
  puts '7 - Exit'
  num = gets.chomp.to_i
  perform_switch(num)
  options
end

# rubocop:disable Metrics/CyclomaticComplexity
def perform_switch(choice)
  case choice
  when 1
    @book_main.list_books
  when 2
    @person_main.list_people
  when 3
    @person_main.create_person
  when 4
    @book_main.create_book
  when 5
    @rental_main.create_rental(@book_main, @person_main)
  when 6
    @rental_main.list_rentals
  when 7
    exit_from_menu
  else puts 'Only digits 1 to 7 are allowed'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def exit_from_menu
  puts 'Thank you for using this app!'
  exit
end

run
