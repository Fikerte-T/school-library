require_relative '../decorator'

describe Decorator do
  describe '#initialize' do
    it 'creates a new decorator' do
      decorator = Decorator.new('Class 1')
      expect(decorator).to be_an_instance_of Decorator
    end
  end
end
