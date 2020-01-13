require_relative 'employee.rb'
require_relative 'product.rb'
require_relative 'startup.rb'
require_relative 'menus.rb'
require_relative 'UI.rb'
require_relative 'tech_name_generator.rb'
include NamesVariables
# require_relative 'ui_generator.rb'
require 'pry'
require 'colorize'

new_menu = UI.new(new_menu)
new_menu.header = "This will be such a cool menu."
new_menu.body = "Can't wait to see \nwhat the heck it does."
new_menu.has_border = true
new_menu.has_divider = true
new_menu.border_type = ("dash_lg")
new_menu.menu_items = ["[1] -  Yes", "[2] - No", 
                        "[3] - Test", "[4] - Test", 
                        "[5] - Test", "[6] - Test"]
new_menu.question_prompt = "What would you like to do?"
new_menu.response = "Thank you for your input!"


new_name = UI.simple_question("What is your name?")

# new_menu.prompt
binding.pry