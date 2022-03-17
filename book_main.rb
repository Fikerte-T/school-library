require_relative './book'
require_relative './preserve_data'

class BookMain
  def add_book(book)
    Book.class_variable_get(:@@books) << book
    @books = Book.class_variable_get(:@@books)
  end

  def create_book
    data = PreserveData.new

    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    book_hash = { 'Title' => book.title, 'Author' => book.author }
    # add_book(book)

    data.write_to_file('./files/books.json', book_hash)
    puts 'Book created successfully'
  end

  def list_books
    data = PreserveData.new

    # @books.each_with_index do |book, index|
    #   puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
    books_list = data.read_from_file('./files/books.json')
    if books_list == 1
      puts 'No books in the library'
    else
      books_list.each_with_index do |book, index|
        puts "(#{index}) Title: #{book['Title']}, Author: #{book['Author']}"
        add_book(book)
      end
    end
    # end
  end
end
