require_relative '../person'
require_relative '../nameable'

describe Person do
  describe '#initialize' do
    before(:each) do
      @person = Person.new(44, 'John', 'y')
    end
    it 'person should be instance of Person class' do
      expect(@person).to be_an_instance_of Person
    end
    it 'Person object has name of type string' do
      expect(@person.name).to be_a(String)
      expect(@person.name).to eq('John')
    end
    it 'Person object has age of type integer' do
      expect(@person.age).to be_a(Integer)
      expect(@person.age).to eq(44)
    end
    it 'Person inherits from nameable' do
      expect(Person).to be < Nameable
    end
    it 'person object responds to a method add_rental' do
      expect(@person).to respond_to(:add_rental)
    end
    it 'person object responds to a method can_use_services?' do
      expect(@person).to respond_to(:can_use_services?)
    end
    it 'person object responds to a method correct_name' do
      expect(@person).to respond_to(:correct_name)
    end
  end
end
