require_relative '../person'

describe Person do
  describe '#initialize' do
    it 'creates a new person' do
      person = Person.new('John', 'Smith')
      expect(person).to be_an_instance_of Person
    end
  end
end