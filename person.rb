Class Person
    attr_reader :id, :name, :age
    attr_writer :name, :age
    def initialize(name = "Unknown",age,parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    def can_use_services?
        return true if is_of_age? || parent_permission
    end    
    private
    def is_of_age?
        return true if is_of_age? >= 18
    end
    
end