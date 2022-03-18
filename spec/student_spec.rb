require_relative '../student'
require_relative '../classroom'

describe Student do
  describe '#initialize' do
    before(:each) do
      @student = Student.new(22, 'John Smith')
    end
    it 'creates a new student' do
      expect(@student).to be_an_instance_of Student
    end
    it 'student object has name of type string' do
        
      expect(@student.name).to be_a(String)
      expect(@student.name).to eq ('John Smith')
    end
    it 'Student object has classroom class' do
      student = Student.new(33, 'Smith', false)
      expect(student.classroom).to eq(nil)
    end

  end
end