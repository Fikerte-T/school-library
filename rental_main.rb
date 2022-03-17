require_relative './book_main'
require_relative './rental'
require_relative './book'
require_relative './person'
require_relative './preserve_data'


class RentalMain
  def rental_add(rental)
    Rental.class_variable_get(:@@rental) << rental
    @rental = Rental.class_variable_get(:@@rental)
    @rental.each_with_index do |rent| 
      @rental_hash = {"Date"=> rent.date, "Book"=> rent.book["Title"], "Author"=> rent.book["Author"], Person=> rent.person["ID"]}
    end

    $data.write_to_file("./files/rentals.json", @rental_hash)

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
    rentals = $data.read_from_file("./files/rentals.json")
    rentals.each do |rent|
      puts "Date: #{rent["Date"]}, Book: #{rent["Book"]} by #{rent["Author"]}" if id == rent["Person"]
    end
  end
end
