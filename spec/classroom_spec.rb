require_relative '../classroom'

describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom' do
      classroom = Classroom.new('Class 1')
      expect(classroom).to be_an_instance_of Classroom
    end
    it 'Classroom object has label of type string' do
        classroom = Classroom.new('Class 1')
        expect(classroom.label).to be_a(String)
        expect(classroom.label).to eq ('Class 1')
    end
    it 'Classroom object responds to a method' do
        classroom = Classroom.new('Class 1')
        expect(classroom).to respond_to(:add_student)
    end
    
  end
end
