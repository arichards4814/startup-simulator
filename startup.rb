class Startup

attr_accessor :funds, :recognition, :name, :employees, :products, :player_name

@@all = []
def initialize(name)
    @name = name
    @recognition = 1
    @funds = 0
    @employees = []
    @products = []

    @@all << self
end

def self.all
    @@all
end

def set_name(name)
    @name = name
end

def increase_recognition(num)
    @recognition += num
    if @recognition < 1 
        @recognition = 1
    elsif @recognition > 100
        @recognition = 100
    end

    puts "---------------------------------------------------".blue
    puts "#{self.name}'s recognition was increased by #{num}!".blue
    puts "----------------------------------------------------".blue
end

def increase_funds(num)
    @funds += num
    if @funds < 0 
        @funds = 0 
    end
end

def hire_employee(employee)
    @employees << employee
    employee.status = "hired"
end

def fire_employee(employee)
    @employees.delete(employee)
    employee.status = "left the company"
end

def create_product(product)
    @product << product
end

end