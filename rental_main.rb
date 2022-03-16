require_relative './book_main'
require_relative './rental'
require_relative './book'
require_relative './person'

class RentalMain
  def rental_add(rental)
    Rental.class_variable_get(:@@rental) << rental
    @rental = Rental.class_variable_get(:@@rental)
  end

  def create_rental(book_main, person_main)
    persons = Person.class_variable_get(:@@people)
    books = Book.class_variable_get(:@@books)
    puts 'Select a book from the following list by number'
    book_main.list_books
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not id)'
    person_main.list_people
    selected_person = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    rental = Rental.new(date, books[selected_book], persons[selected_person])
    rental_add(rental)
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
end
