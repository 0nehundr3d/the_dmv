class Registrant 
    attr_reader :name

    def initialize(name, age, permit = false)
        @name = name
    end
end