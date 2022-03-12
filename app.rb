require './person'
require './book'
require './classroom'
require './rental'
require './student'
require './teacher'

class App
  def run
    @books = []
    @person = []
    @rental = []
    puts 'Welcome to School Library App!'
    puts "\n"
    options
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all retnals for a given person id'
    puts '7 - Exit'
    num = gets.chomp.to_i
    perform_switch(num)
    options
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def perform_switch(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      exit_from_menu
    else puts 'Only digits 1 to 7 are allowed'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp.to_i
    case num
    when 1
      @person.push(create_student)
      puts 'Student created successfully'
    when 2
      @person.push(create_teacher)
      puts 'Teacher created successfully'
    end
  end

  def create_student
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp.to_s
    puts 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    case permission
    when 'y'
      parent_permission = true
      Student.new(age, name, parent_permission)
    when 'n'
      parent_permission = false
      Student.new(age, name, parent_permission)
    else
      puts 'Please enter Y/N[y/n]'
      create_student
    end
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_books
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    if @person.empty?
      puts "\nNo registered person. You can create a person from the main menu."
      puts
    else
      @person.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}}"
        else
          puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not id)'
    list_people
    selected_person = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    @rental.push(Rental.new(date, @books[selected_book], @person[selected_person]))
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}" if id == rent.person.id
    end
  end

  def exit_from_menu
    puts 'Thank you for using this app!'
    exit
  end
end
