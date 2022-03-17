require_relative './person'
require_relative './preserve_data'


$data = PreserveData.new

class PersonMain
  def add_person(person)
    Person.class_variable_get(:@@people) << person
    @people = Person.class_variable_get(:@@people)

    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        @person_hash = {"Type" => "Student","Name" => person.name, "ID" => person.id, "Age"=>person.age}
      else
        @person_hash = {"Type" => "Teacher","Name" => person.name, "ID" => person.id, "Age"=>person.age}
      end
    end
    $data.write_to_file("./files/people.json", @person_hash)


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
    if @people.empty?
      puts "\nNo registered person. You can create a person from the main menu."
      puts
    else
      @people.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end
end
