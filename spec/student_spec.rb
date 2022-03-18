require_relative '../student'

describe Student do
  describe '#initialize' do
    it 'creates a new student' do
      student = Student.new(33, 'Smith', false)
      expect(student).to be_an_instance_of Student
    end
    it 'Student object has first name of type string' do
      student = Student.new(33, 'Smith', false)
      expect(student.name).to be_a(String)
      expect(student.name).to eq('Smith')
    end
    it 'Student object has age of type integer' do
      student = Student.new(33, 'Smith', false)
      expect(student.age).to be_a(Integer)
      expect(student.age).to eq(33)
    end
    it 'Student object has a method play_hooky' do
      student = Student.new(33, 'Smith', false)
      expect(student).to respond_to(:play_hooky)
    end
    it 'Student inherits from Person' do
      expect(Student).to be < Person
    end
  end
end
