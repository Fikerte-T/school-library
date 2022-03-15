require_relative './book'

class BookMain
    
    def add_book(book)
        Book.class_variable_get(:@@books) << book
        @books = Book.class_variable_get(:@@books)
    end
    def create_book
        puts 'Title: '
        title = gets.chomp
        puts 'Author: '
        author = gets.chomp
        book = Book.new(title, author)
        add_book(book)
        puts 'Book created successfully'
        # books = Book.class_variable_get(:@@books)
      end
      
      def list_books
        Book.class_variable_get(:@@books).each_with_index do |book, index| puts  "(#{index}) Title: #{book.title}, Author: #{book.author}"
        end
      end
end