require_relative 'employee.rb'
require_relative 'product.rb'
require_relative 'startup.rb'
require 'pry'
require 'colorize'



def begin_game
    puts "-------------------------------"
    puts "WELCOME TO STARTUP SIMULATOR!!!"
    puts "-------------------------------"
    puts "enter your name to continue"
    player_name = gets.chomp
    puts "Hi, #{player_name} congratulations on becoming"
    puts "an entreprenuer!"
    puts "(enter to continue)"
    gets.chomp
    puts "So tell me... what are you calling your company?"
    company_name = gets.chomp
    puts "Wow... #{company_name}... has a... nice ring to it."
    puts "(enter to continue)"
    gets.chomp
    puts "Before you build your startup first we have to"
    puts "pitch to some VENTURE CAPITALISTS and raise MONEY!!!"
    puts "(enter to continue)"
    gets.chomp
    5.times{puts ""}
    puts "------------------------------------------------------------"
    puts "                       WEEK 1!!!                            |"
    puts "------------------------------------------------------------"
    puts "|                  #{company_name}                          |".green
    puts "|           Funds: $0  Employees: 0 Products: 0             |"
    puts "-------------------------------------------------------------"
    puts "|  1. Try to Raise Capital                                  |"
    puts "|  2. Hire Employees            4. View Employees           |".red
    puts "|  3. Build/ Improve Products   5. View Products            |".red
    puts "-------------------------------------------------------------"
    5.times{puts ""}
    puts "Above is your company panel. Here you can decide"
    puts "what you want to do during the current week."
    puts "You can only choose one action per week so choose wisely!"
    puts "(enter number to choose)"
    i = 0
    while i < 3 
        selection = gets.strip.to_i
        if selection === 1
        
            break
        elsif selection === (2 || 3 || 4 || 5 || 6)
            "Selection not available"

        else
            "Please enter a number for what you want to do."
        end
    end
    5.times{puts ""}
    puts "------------------------------------------------------------"
    puts "                       WEEK 1!!!                            |"
    puts "------------------------------------------------------------"
    puts "|                    RAISE CAPITAL                          |".blue
    puts "|           Funds: $0  Employees: 0 Products: 0             |"
    puts "-------------------------------------------------------------"
    puts "|  1. Family and Friends    4. ??????????????               |"
    puts "|  2. ??????????            5. ??????????????               |"
    puts "|  3. ??????????            6. ??????????????               |"
    puts "-------------------------------------------------------------"
    5.times{puts ""}
    puts "Choose who you would like to raise money from."
    gets.chomp
    i = 0
    while i < 3 
        selection = gets.strip.to_i
        if selection === 1
        
            break
        elsif selection == 2 || selection == 3 || selection == 4 || selection == 5 || selection == 6
            "Selection not available"

        else
            "Please enter a number for what you want to do."
        end
    end

    
end




def instantiate_employees
    names = ["Alice", "Barry", "Charlie", "Adam", "Edgar", "Avi",
    "Matthew", "Jerry", "Darius", "Billy", "Jay", "Steph", "Mary",
    "Jalapeno", "Sarah", "Meghan"]

    names.each do |name|
        name = Employee.new(name)
    end
end

def puts_menu(title,i1 = "??????????", i2 = "??????????", i3 = "??????????", i4 = "??????????", i5 = "??????????", i6 = "??????????")
    5.times{puts ""}
    puts "------------------------------------------------------------"
    puts "                       WEEK 1!!!                            |"
    puts "------------------------------------------------------------"
    puts "|                    #{title}                          |".blue
    puts "|           Funds: $0  Employees: 0 Products: 0             |"
    puts "-------------------------------------------------------------"
    puts "|  1. #{i1}    4. #{i4}               |"
    puts "|  2. #{i2}            5. #{i5}               |"
    puts "|  3. #{i3}            6. #{i6}               |"
    puts "-------------------------------------------------------------"
    5.times{puts ""}

end

instantiate_employees
#begin_game

binding.pry