require './person'
require 'pry'
class Teacher < Person
  attr_accessor :specialization
  def initialize(specialization, age, name= "unknown", parent_permission: true)
    super(age,name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(88,'AI','James')
p teacher1.name
p teacher1.age
p teacher1.specialization

binding.pry