require_relative '../config/environment.rb'

class Startup

attr_accessor :funds, :recognition, :name, :employees, :products, :player_name, :fam_trys

@@all = []
def initialize(name)
    @name = name
    @recognition = 1
    @funds = 0
    @employees = []
    @products = []
    @fam_trys = 0
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

def hire_employee(employee, week)
    @employees << employee
    employee.status = "hired"
    ##create game event... 
    GameEvent.new(employee, week, " has been hired!")
end

def fire_employee(employee)
    @employees.delete(employee)
    employee.status = "left the company"
end

def create_product(product, week)
    @product << product
    GameEvent.new(product, week, " has been created!")
end

def all_products
    @products
end

def all_employees
    @employees
end

def raise_capital_friends_and_fam(week)
    UI.blank_space(7)
    if @fam_trys == 0
        UI.announce("Your friend Gary believes in you... he gives you $5000!".green)
        self.increase_funds(5000)
        UI.announce("Your Uncle Steve thinks your idea will never work... he tells you to get lost!".red)
        UI.announce("Your Cousin Darius has your back. He gives you $15000!".green)
        self.increase_funds(15000)
        GameEvent.new(nil, week, "You've raised $20000!")
        @fam_trys += 1
    elsif @fam_trys == 1
        UI.announce("Your friend Bill doesn't have anything to give you! But he shares your company on the internet!".green)
        self.increase_recognition(1)
        UI.announce("Your friend Harvey doesn't like you... but he gives you $5000 anyway!".green)
        self.increase_funds(5000)
        UI.announce("Your Uncle Boris recently came into some money. He gives you $5000!".green)
        self.increase_funds(5000)
        GameEvent.new(nil, week, "You've raised $10000!")
        GameEvent.new(nil, week, "Your recognition has been increased by 1 point!")
        @fam_trys += 1
    elsif @fam_trys >= 2
    # UI.announce( "Your family and friends are sick of you trying to raise money from them".red)
    GameEvent.new(nil, week, "Your family and friends are sick of you trying to raise money from them", "red")
    @fam_trys += 1
    ##NEED THIS TO GO BACK TO THE MENU... or just make this a game event 
    end
end

def weekly_payroll_deducted(week)
    payroll = 0
    @employees.each do |employee|
        payroll = payroll + (employee.salary / 52)
    end
    if @funds - payroll > 0
    @funds = @funds - payroll
    GameEvent.new(nil, week, "$#{payroll} has been deducted for payroll.", "red")
    else 
        @employees.each do |employee|
            employee.morale -= 2
        end
        if employees.count >= 1
        GameEvent.new(nil, week, "Your employee(s) have not been paid... their morale has dropped tremendously.", "red")
        else
        GameEvent.new(nil, week, "You've been eating ramen for quite a bit of time now... you should probably raise some money.", "red")
        end
    end
end

def weekly_products_sold(week)

    total_revenue = 0
    recognition = self.recognition
    num_of_sales_people = 0

    self.employees.each do |employee|
        if employee.job == "Sales"
            num_of_sales_people += 1
        end
    end

    self.products.each do |product|
        copies_sold = num_of_sales_people + recognition + product.product_strength
        copies_sold = copies_sold * rand(30..65)
        total_revenue = total_revenue + (product.price * copies_sold)

        GameEvent.new(nil, week, "#{product.name} has sold #{copies_sold} copies at $#{product.price}.")
    end

    GameEvent.new(nil, week, "You generated $#{total_revenue} in revenue.")
    @funds = @funds + total_revenue

end

def hired_employee_total_skill
    total_skill = 0
    employees.each do |employee|
        total_skill = total_skill + employee.skill_level
    end
    total_skill
end

def list_employees
    final_output = ""
    if employees.count == 0
        final_output = "\n                You have not hired any employees. \n      ".blue
    else
        employees.each do |employee|
            final_output = final_output + "___________________________________________________________\n   Name: #{employee.name}    |   Job: #{employee.job}  |   Skill: #{employee.skill_level} \n  Salary: #{employee.salary}  |  Morale: #{employee.morale}    |  Personality: #{employee.personality}\n___________________________________________________________ \n  "
        end
    end
    final_output
end

def list_products
    final_output = ""
    if products.count == 0
        final_output = "\n                You have not built any products. \n     ".blue
    else
        products.each do |product|
            final_output = final_output + "___________________________________________________________\n   Name: #{product.name}    |   Product Strength: #{product.product_strength}  |   Status: #{product.status} \n  Price: $#{product.price} \n___________________________________________________________ \n  "
        end
    end
    final_output
end


end