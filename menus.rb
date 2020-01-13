require 'colorize'

def build_menu(title,i1 = "??????????", i2 = "??????????", i3 = "??????????", i4 = "??????????", i5 = "??????????", i6 = "??????????")
    5.times{puts ""}
    puts "------------------------------------------------------------"
    puts "                       WEEK 1!!!                            |"
    puts "------------------------------------------------------------"
    puts "                       #{title}                          ".blue
    puts "|           Funds: $0  Employees: 0 Products: 0             |"
    puts "-------------------------------------------------------------"
    puts "|  1. #{i1}            4. #{i4}               "
    puts "|  2. #{i2}            5. #{i5}               "
    puts "|  3. #{i3}            6. #{i6}               "
    puts "-------------------------------------------------------------"
    5.times{puts ""}

end

# build_menu("Title","Raise Capital       ", "Hire Employee       ", "Build/Improve Product", "Company", "Employees", "Products" )

def menu_1_input

    ##going to use a parameter here so I can decide which menu items are available
    puts "Choose your"
    input = gets.chomp.to_i

    case input
        
    when 1
        puts "test worked"
        return
    when 2
        puts "test worked"
        return
    when 3
        puts "test worked"
        return
    when 4
        puts "test worked"
        return
    when 5
        puts "test worked"
        return
    when 6
         puts "test worked"
        return
    else
        menu_input_1
    end 

end

##heres how to create a menu 1 that asks for input
# build_menu("Title","Raise Capital       ", "Hire Employee       ", "Build/Improve Product", "Company", "Employees", "Products" )
# menu_1_input