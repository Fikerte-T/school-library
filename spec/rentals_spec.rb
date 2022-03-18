require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  describe '#initialize' do
    it 'creates a new rental' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(44, 'John', 'y')
      rental = Rental.new('03/18/2022', book, person)
      expect(rental).to be_an_instance_of Rental
    end
    it 'Rental object has a due date of type string' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(44, 'John', 'y')
      rental = Rental.new('03/18/2022', book, person)
      expect(rental.date).to be_a(String)
      expect(rental.date).to eq('03/18/2022')
    end
    it 'Rental object has a book of type Book' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(44, 'John', 'y')
      rental = Rental.new('03/18/2022', book, person)
      expect(rental.book).to be_an_instance_of Book
      expect(rental.book).to eq(book)
    end
    it 'Rental object has a person of type Person' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(44, 'John', 'y')
      rental = Rental.new('03/18/2022', book, person)
      expect(rental.person).to be_an_instance_of Person
      expect(rental.person).to eq(person)
    end
  end
end
