require './person'
require 'pry'
class Teacher < Person
  def initialize(specialization, age, parent_permission: true)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new('AI', 55, 'James')
p teacher1.name
p teacher1.age