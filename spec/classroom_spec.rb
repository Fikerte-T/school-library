require_relative '../classroom'

describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom' do
      classroom = Classroom.new('Class 1')
      expect(classroom).to be_an_instance_of Classroom
    end
  end
end
