# STARTUP SIMULATOR
## Like lemonade stand but way more advanced.

What you need....
If you do not have the gem 'colorize' please make sure to install it. 
If you don't use the ruby gem 'pry' I also recommend you use it. 

Thanks for taking a look at Startup Simulator and the Tiny Game Engine (TGE). 
Tiny Game Engine is a UI and game design system created to make building games
in the command line easy!!! I encourage you to fork and use the Tiny Game Engine
and try to build your own games! 

Create by Andrew Richards - github: arichards4814


#### Classes

## Startup
- [x]`#name` - returns the name of the startup
- [x]`#funds` - returns the current funds of the startup
- [x]`#recognition` - returns the recognition level of the startup
- [x]`#employees` - returns the current employees of the startup
- [x]`#increase_recognition` - takes a parameter num and increases the recognition level by that number. Can only be between 1 and 100.
- [x]`#increase_funds` - takes a parameter num and increases (or decreases) the funds by that value. If the funds fall below 0, funds are returned as 0.
- [x]`#hire_employee` - takes an argument (employee obj) and adds that employee object to the employees array
- [x]`#fire_employee` - takes an employee obj argument and removes that emp from the employees array and changes his status to "left the company"


## Employee
- [x]`#name` - returns the name of the startup
- [x]`#salary` - returns the salary of the employee
- [x]`#job` - returns the job (programmer or salesman)
- [x]`#personality` - returns the personality of the employee
- [x]`#skill_level` - returns the current skill level of the employee
- [x]`#status` - returns the current status of the employee
- [x]`.all` - returns all instances of employee
- [x]`.three_emps` - returns an array of three random employees that are currently Looking for work
- [x]`#increase_skill` - increases the skill of the employee.



## Product


## UI

- [x]`.all` - returns all menu objects
- [x]`#menu_title` - returns the menu title
- [x]`#menu_items` - returns the menu items
- [x]`#visual` - stores the visual for the menu. (How the menu looks)
- [x]`#logic` - returns an array with the logic. (User inputs 1..6 what will happen)
- [x]`#set_logic` - sets the logic of your menu items. This is where menu links are created. 
- [x]`#get_input` - gets the users input and returns the logic (User inputs 1..6 what will happen)
- [x]`#prompt` - puts the visual menu, then uses the get_input method to decide what to do next when the user inputs something. 
- [x]`#has_border` - boolean, set this as true to give a top and bottom border to your menu
- [x]`#border_type` - takes a parameter, the border type and creates that border in your menu.. *see below for details.
- [x]`.announce` - puts an announcement with 2 line borders and press enter to continue
- [x]`.ask_for_enter` - puts "[press enter to continue]"
- [x]`.blank_space` - takes a parameter for the number of blank lines you want to puts. then puts that many lines.
- [x]`.simple_question` - takes a parameter, the question, and puts it returning the gets.chomp response
- 

### Pass the current strings as a parameter in #border_type to create that border. #has_border must be set to true for border to show

* border types - dash-sm, dash-md, dash-lg, line-sm, line-md, line-lg, 
                carrot-sm, carrot-md, carrot-lg, squiggles-sm, squiggles-md
                squiggles-lg





# Menu Instances
main_menu
    raise_money
    hire_employees
        employee_choice
    build/improve products
        build
        improve
    company info
    employee info



STARTUP SIMULATOR FEATURES

# TECH NAME GENERATOR (tech_name_generator.rb)
Generates a random tech name for your company

TINY GAME ENGINE (TGE) FEATURES

# UI Creator (UI.rb)
Allows you to build out robust, styled menus. 

# (Eventually) Gameobject Class (gameobject.rb)
Will allow you to build player characters, enemy characters.

# (Eventually) Story Class (story.rb)
Will allow you to build stories with decision making branches that effect the direction of the story.



