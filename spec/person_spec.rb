require_relative '../person'
require_relative '../nameable'

describe Person do
  describe '#initialize' do
    it 'creates a new person' do
      person = Person.new(44, 'John', 'y')
      expect(person).to be_an_instance_of Person
    end
    it 'Person object has name of type string' do
      person = Person.new(44, 'John', 'y')
      expect(person.name).to be_a(String)
      expect(person.name).to eq('John')
    end
    it 'Person object has age of type integer' do
      person = Person.new(44, 'John', 'y')
      expect(person.age).to be_a(Integer)
      expect(person.age).to eq(44)
    end
    it 'Person inherits from nameable' do
      expect(Person).to be < Nameable
    end
  end
end
