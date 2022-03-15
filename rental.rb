# rubocop: disable Style/ClassVars
class Rental
  attr_accessor :date
  attr_reader :book, :person

  @@rental = []

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
# rubocop: enable Style/ClassVars
