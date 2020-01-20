require_relative './config/environment.rb'
# require_relative 'ui_generator.rb'
require 'pry'
require 'colorize'

our_startup = Startup.new("our_startup")
employ1 = Employee.new("Tim")
employ2 = Employee.new("John")
employ3 = Employee.new("Steve")
employ4 = Employee.new("Pilgrim")
our_startup.hire_employee(employ1, 1)
our_startup.hire_employee(employ2, 1)
our_startup.hire_employee(employ3, 1)
our_startup.hire_employee(employ4, 1)
# prod1 = Product.new("The Thing")
# ge1 = GameEvent.new(employ1, 1, " has been employed.")
# ge2 = GameEvent.new(employ2, 1, " has been employed.")
# ge2 = GameEvent.new(prod1, 1, " has been created.")
# ge3 = GameEvent.new(employ3, 2, " has been employed.")

# i = 0
#     while i < 30
#     Employee.new(MALE_FIRST[rand(MALE_FIRST.count)])
#     Employee.new(FEMALE_FIRST[rand(FEMALE_FIRST.count)])
#     i += 1
#     end

# ##game trigger tests
# x = 0 
# def test_method1
#     puts "less than"
# end
# def test_method
#     puts "it worked"
# end

# a = GameTrigger.new(x, "<", 3, method(:test_method1))
# b = GameTrigger.new(x, ">", 3, method(:test_method))

# while x < 5
# a.check_variable = x
# b.check_variable = x

# a.update_gamestate
# b.update_gamestate
# # x += 1
# # end

# new_prod_name = generate_product_name(ARTICLE, NOUN, VERB_W_ER).split.map(&:capitalize)*' '
# puts new_prod_name

# def build_product_loop(current_week, num_of_weeks_to_build, product_name)
#     product_object = Product.new(product_name)
#     i = 0

#     while i < num_of_weeks_to_build

#         UI.announce("Week: #{current_week + i} \n               Your new product #{product_name} is being built")
#         i += 1 
#     end
#     product_object.status = "built"

#     UI.announce("CONGRATULATIONS #{product_name} HAS BEEN BUILT!!", "green")

#     ## will return the new number of weeks that we're on
#     return current_week + num_of_weeks_to_build
# end

# # build_product_loop(3, 3, new_prod_name)
# UI.billboard("COMPANY PANEL")
# UI.announce("THANKS FOR USING TINY GAME ENGINE")

    main_menu_ui = UI.new("main_menu_ui")
    main_menu_ui.menu_items = ["[1] - Try to Raise Capital  ", "[2] - Hire Employees        ", "[3] - Build/Improve Products",
                            "[4] - View Company", "[5] - View Employees"]
    main_menu_ui.header = "                               MAIN MENU - Week:"
    main_menu_ui.body = "         Funds: $ Employees:  Products: "
    main_menu_ui.has_border = true
    main_menu_ui.border_type = "dash-lg"
    main_menu_ui.has_divider = true
    main_menu_ui.parent_menu = main_menu_ui

    main_menu_ui.prompt

binding.pry


# GameEvent.weeks_summary(1)
# UI.announce("Week #{week} is over!")
# new_name = UI.simple_question("What is your name?")
binding.pry
0



# new_menu.prompt