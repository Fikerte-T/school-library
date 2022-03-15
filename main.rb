require './person'
require './book'
require './classroom'
require './rental'
require './student'
require './teacher'
require_relative './person_main'
require_relative './book_main'
@person_main = PersonMain.new
@book_main = BookMain.new

  def run
    @books = []
    @person = []
    @rental = []
    puts 'Welcome to School Library App!'
    puts "\n"
    options
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
      create_rental
    when 6
      list_rentals
    when 7
      exit_from_menu
    else puts 'Only digits 1 to 7 are allowed'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

 
  
 



  

  def create_rental
    puts 'Select a book from the following list by number'
    @book_main.list_books
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not id)'
    list_people
    selected_person = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    @rental.push(Rental.new(date, @books[selected_book], @person[selected_person]))
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}" if id == rent.person.id
    end
  end

  def exit_from_menu
    puts 'Thank you for using this app!'
    exit
  end


run