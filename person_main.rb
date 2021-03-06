require_relative './person'
require_relative './preserve_data'

class PersonMain
  def add_person(person)
    Person.class_variable_get(:@@people) << person
    @people = Person.class_variable_get(:@@people)
    data = PreserveData.new

    @people.each_with_index do |p, _index|
      @person_hash = if p.is_a?(Student)
                       { 'Type' => 'Student', 'Name' => p.name, 'ID' => p.id, 'Age' => p.age }
                     else
                       { 'Type' => 'Teacher', 'Name' => p.name, 'ID' => p.id, 'Age' => p.age }
                     end
    end
    data.write_to_file('./files/people.json', @person_hash)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp.to_i
    case num
    when 1
      create_student
      puts 'Student created successfully'
    when 2
      create_teacher
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
      student = Student.new(age, name, parent_permission)
      add_person(student)
    when 'n'
      parent_permission = false
      student = Student.new(age, name, parent_permission)
      add_person(student)
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
    teacher = Teacher.new(specialization, age, name)
    add_person(teacher)
  end

  def list_people
    data = PreserveData.new
    temp_data = data.read_from_file('./files/people.json')
    if temp_data == 1
      puts "\nNo registered person. You can create a person from the main menu."
      puts
    else
      temp_data.each_with_index do |person, index|
        if person['Type'] == 'Student'
          puts "#{index}) [Student] Name: #{person['Name']}, ID: #{person['ID']}, Age: #{person['Age']}"
        else
          puts "#{index}) [Teacher] Name: #{person['Name']}, ID: #{person['ID']}, Age: #{person['Age']}"
        end
        Person.class_variable_get(:@@people) << person
      end
    end
  end
end
