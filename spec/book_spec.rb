require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new book' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      expect(book).to be_an_instance_of Book
    end
    it 'Book object has title of type string' do
        book = Book.new('The Hobbit', 'J.R.R. Tolkien')
        expect(book.title).to be_a(String)
        expect(book.title).to eq ('The Hobbit')
    end
    it 'Book object has author of type string' do
        book = Book.new('The Hobbit', 'J.R.R. Tolkien')
        expect(book.author).to be_a(String)
        expect(book.author).to eq ('J.R.R. Tolkien')
    end
 
end
end