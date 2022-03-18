require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher' do
      teacher = Teacher.new('John', 'Smith')
      expect(teacher).to be_an_instance_of Teacher
    end
  end
end