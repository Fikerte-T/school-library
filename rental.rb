require_relative './person'
require_relative './book'

# rubocop: disable Style/ClassVars

class Rental
  attr_accessor :date
  attr_reader :book, :person

  @@rental = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end
# rubocop: enable Style/ClassVars
