require_relative 'employee.rb'
require_relative 'product.rb'
require_relative 'startup.rb'
require_relative 'menus.rb'
require_relative 'UI.rb'
require_relative 'tech_name_generator.rb'
require_relative 'gameevent.rb'
include NamesVariables
include NamesVariablesMenWomen
# require_relative 'ui_generator.rb'
require 'pry'
require 'colorize'

# employ1 = Employee.new("Tim")
# employ2 = Employee.new("John")
# employ3 = Employee.new("Steve")
# employ4 = Employee.new("Pilgrim")

# prod1 = Product.new("The Thing")

# ge1 = GameEvent.new(employ1, 1, " has been employed.")

# ge2 = GameEvent.new(employ2, 1, " has been employed.")

# ge2 = GameEvent.new(prod1, 1, " has been created.")

# ge3 = GameEvent.new(employ3, 2, " has been employed.")

i = 0
    while i < 30
    Employee.new(MALE_FIRST[rand(MALE_FIRST.count)])
    Employee.new(FEMALE_FIRST[rand(FEMALE_FIRST.count)])
    i += 1
    end

binding.pry


# GameEvent.weeks_summary(1)
# UI.announce("Week #{week} is over!")

# new_name = UI.simple_question("What is your name?")
binding.pry
0



# new_menu.prompt