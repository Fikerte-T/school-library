require_relative '../student'

describe Student do
  describe '#initialize' do
    it 'creates a new student' do
      student = Student.new('John', 'Smith')
      expect(student).to be_an_instance_of Student
    end
  end
end