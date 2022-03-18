require_relative '../book'

describe Book do
  describe '#initialize' do
    before(:each) do
      @book = Book.new('The Hobbit', 'J.R.R. Tolkien', [])
    end
    it 'creates a new book' do
      expect(@book).to be_an_instance_of Book
    end
    it 'Book object has title of type string' do
      expect(@book.title).to be_a(String)
      expect(@book.title).to eq('The Hobbit')
    end
    it 'Book object has author of type string' do
      expect(@book.author).to be_a(String)
      expect(@book.author).to eq('J.R.R. Tolkien')
    end
    it 'Book object responds to a method add_rental' do
      expect(@book).to respond_to(:add_rental)
    end
  end
end
