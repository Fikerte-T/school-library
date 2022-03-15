require_relative './person'

class Person_Main 

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
    

end