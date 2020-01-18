class Product

    attr_accessor :name, :product_strength, :status, :price

@@all = []
def initialize(name)
    @name = name
    @product_strength = 1
    @status = "being built"
    @price = 20

    @@all << self
end

def self.all
    @@all
end


def self.build_product_loop(current_week, num_of_weeks_to_build, product_name, startup_object)
    product_object = Product.new(product_name)
    i = 0

    while i < num_of_weeks_to_build

        UI.announce("Week: #{current_week + i} \n               Your new product #{product_name} is being built")
        i += 1 
    end

    ##calculate product strength 
    ##add up all employee skill
    ##
    ##if average morale is below 5 (-2) product strength
    total_skill = 0

    startup_object.employees.each do |employee|
        total_skill = total_skill + employee.skill_level 
    end

    morale_array = startup_object.employees.map do |employee|
        employee.morale
    end

    morale_average = morale_array.inject{ |sum, el| sum + el }.to_f / morale_array.size

    product_object.product_strength = product_object.product_strength + total_skill
    if morale_average < 5.0
        product_object.product_strength = product_object.product_strength - 2
    end

    startup_object.increase_recognition(1)
    ##decrease morale of employees

    product_object.status = "built"
    startup_object.products << product_object

    UI.announce("CONGRATULATIONS #{product_name} HAS BEEN BUILT!!", "green")

    ## will return the new number of weeks that we're on
    GameEvent.increment_game_clock(num_of_weeks_to_build)
   
end

end