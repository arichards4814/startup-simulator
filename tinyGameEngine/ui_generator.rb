require_relative 'UI.rb'
# require 'pry'
require_relative 'tech_name_generator.rb'
require_relative 'ui_design_module.rb'
require_relative 'startup.rb'
include NamesVariables
##include the module in this file to grab the variables

### BUILD YOUR MENUS HERE ###


def generate_menus

    our_startup = Startup.new("No Name")
    
    ## START GAME UI ##
    start_game_ui = UI.new("start_game_ui")
    start_game_ui.menu_items = ["[1] - Yes", "[2] - Generate Another"]
    random_name = generate_name(NAMES1,NAMES2,NAMES3)
    ##set up logic##
    method1_test = our_startup.set_name(random_name)
    rerun = "I WANT MY METHOD TO BE STORED HERE"
    start_game_ui.set_logic(random_name)
    start_game_ui.header = ("          " + random_name.blue)
    start_game_ui.body = (
        "-----------------------------------------\n
        Do you want to use this as your company name?
        \n-----------------------------------------")
end
## General Purpose 


#binding.pry
##start_game_ui


