require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new book' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      expect(book).to be_an_instance_of Book
    end
  end
end