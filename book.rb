# rubocop: disable Style/ClassVars
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  @@books = []

  def initialize(title, author, rental = [])
    @title = title
    @author = author
    @rentals = rental
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
# rubocop: enable Style/ClassVars
