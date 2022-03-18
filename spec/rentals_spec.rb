require_relative '../rental'

describe Rental do
  describe '#initialize' do
    it 'creates a new rental' do
      rental = Rental.new('Class 1', 'John', 'Smith', 'The Hobbit', 'J.R.R. Tolkien')
      expect(rental).to be_an_instance_of Rental
    end
  end
end