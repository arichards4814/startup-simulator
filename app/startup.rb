require_relative '../config/environment.rb'

class Startup

attr_accessor :funds, :recognition, :name, :employees, :products, :player_name, :fam_trys, :percentage_owned, :total_game_score

@@all = []
def initialize(name)
    @name = name
    @recognition = 1
    @funds = 0
    @employees = []
    @products = []
    @fam_trys = 0
    @percentage_owned = 100
    @@all << self
end

def self.all
    @@all
end

def sell_shares(num)
    @percentage_owned =  @percentage_owned - num
end

# def set_name(name)
#     @name = name
# end

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
    @employees.each do |employee|
        employee.increase_morale(1, week)
    end
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
        UI.blank_space(5)
        UI.announce("Your friend Gary believes in you... he gives you $2000!".green)
        self.increase_funds(2000)
        UI.blank_space(5)
        UI.announce("Your Uncle Steve thinks your idea will never work... he tells you to get lost!".red)
        UI.blank_space(5)
        UI.announce("Your Cousin Darius has your back. He gives you $6000!".green)
        self.increase_funds(6000)
        self.sell_shares(5)
        GameEvent.new(nil, week, "You've sold off 5% of your company.")
        GameEvent.new(nil, week, "You've raised $8000!")
        @fam_trys += 1
    elsif @fam_trys == 1
        UI.blank_space(5)
        UI.announce("Your friend Bill doesn't have anything to give you! But he shares your company on the internet!".green)
        UI.blank_space(5)
        self.increase_recognition(1)
        UI.ask_for_enter
        UI.blank_space(5)
        UI.announce("Your friend Harvey doesn't like you... but he gives you $5000 anyway!".green)
        self.increase_funds(5000)
        UI.blank_space(5)
        UI.announce("Your Uncle Boris recently came into some money. He gives you $5000!".green)
        self.increase_funds(5000)
        self.sell_shares(5)
        GameEvent.new(nil, week, "You've sold off 5% of your company.")
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

def product_strength_total
    prod_str_tot = 0
    @products.each do |product|
        prod_str_tot = product.product_strength + prod_str_tot
    end
    prod_str_tot
end


def raise_capital(level, week)

# if 2 3 4 5 6

if level == 2
    raised = product_strength_total * 10000
    self.increase_funds(raised)
    self.sell_shares(5)
    GameEvent.new(nil, week, "You've sold off 5% of your company.")
    GameEvent.new(nil, week, "You have raised $#{raised} from local investors!", "green")
elsif level == 3
    raised = product_strength_total * 50000
    self.increase_funds(raised)
    self.sell_shares(5)
    GameEvent.new(nil, week, "You've sold off 5% of your company.")
    GameEvent.new(nil, week, "You have raised $#{raised} from regional investors!", "green")
elsif level == 4
    raised = product_strength_total * 100000
    self.increase_funds(raised)
    self.sell_shares(5)
    GameEvent.new(nil, week, "You've sold off 5% of your company.")
    GameEvent.new(nil, week, "You have raised $#{raised} from Silicone Valley Gurus!", "green")
elsif level == 5
    raised = product_strength_total * 500000
    self.increase_funds(raised)
    self.sell_shares(5)
    GameEvent.new(nil, week, "You've sold off 5% of your company.")
    GameEvent.new(nil, week, "You have raised $#{raised} from Elite Venture Capitalists!", "green")
elsif level == 6
    raised = product_strength_total * 1000000
    self.increase_funds(raised)
    self.sell_shares(5)
    GameEvent.new(nil, week, "You've sold off 5% of your company.")
    GameEvent.new(nil, week, "You have raised $#{raised} from your public offering!", "green")
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

    GameEvent.new(nil, week, "You generated $#{total_revenue} in revenue.", "green")
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
            final_output = final_output + "___________________________________________________________\n   Name: #{employee.name}    |   Job: #{employee.job}  |   Skill: #{employee.skill_level} \n  Salary: $#{employee.salary}  |  Morale: #{employee.morale}    |  Personality: #{employee.personality}\n___________________________________________________________ \n  "
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
            final_output = final_output + "___________________________________________________________\n   Name: #{product.name}    |   Product Strength: #{product.product_strength}  \n    Price: $#{product.price} \n___________________________________________________________ \n  "
        end
    end
    final_output
end

def company_info
    ## get average morale
    num = 0 
    num2 = 0
    if @employees.count > 0
        @employees.each do |employee|
            num = employee.morale + num
        end
        num = num / @employees.count
    end

    #get average product strength
    if @products.count > 0
        @products.each do |product|
            num2 = product.product_strength + num2
        end
        num2 = num2 / @products.count
    end

    morale = Startup.excellent_or_severe(num)
    recognition = Startup.recognition_excellent_etc(@recognition)
    products_str = Startup.excellent_or_severe(num2)
    team_skill = Startup.excellent_or_severe(hired_employee_total_skill)
    payroll = 0
    percentage_owned = @percentage_owned
    @employees.each do |employee|
            payroll = payroll + (employee.salary / 52)
    end 
    puts " "
    puts "                #{self.name}".magenta
    puts "                CEO: #{self.player_name}".blue
    puts "                -------------------------------------"
    puts "                Team Morale: #{morale}"
    puts "                Recognition: #{recognition}"
    puts "                Products Strength: #{products_str}"
    puts "                Team Expertise: #{team_skill}"
    puts "                Payroll: $#{payroll} per week"
    puts "                Percentage Owned: #{@percentage_owned}%"
    puts "                -------------------------------------"
    puts "                Total Game Score: #{calculate_total_game_score}" 
    
    # puts "Team Chemistry: "
    
end

def self.excellent_or_severe(num)
    if num == 8 || num == 9 || num >= 10
        read ="Excellent".magenta
    elsif num == 6 || num == 7
        read = "Good".green
    elsif num == 5
        read = "OK".blue
    elsif num == 3 || num == 4
        read = "Bad".red
    elsif num == 2 || num == 1
        read ="Severe".red
    # elsif num == 0 && @employees
    #     "N/A".yellow
    elsif num == 0 
        "Very Severe".red
    end
end

def self.recognition_excellent_etc(num)
    if num == 8 || num == 9 || num >= 10
        read ="Worldwide".magenta
    elsif num == 6 || num == 7
        read = "Country Wide".green
    elsif num == 5
        read = "Regional".blue
    elsif num == 3 || num == 4
        read = "Locally Known".red
    elsif num == 2 || num == 1
        read ="Low".red
    elsif num == 0
        "N/A".yellow
    end
end

def personality_bonus
    ## not finished
    # personality_hash = {}
    # personalities = @employees.map do |employee|
    #     employee.personality
    # end
    # unique_personalities = []

    # personalities.each do |personality|
    #     if !unique_personalities.include?(personality)
    #         unique_personalities << personality
    #     end
    # end

    # if personalities.count >= 3
    #     unique_personalities.each do |u_personality|
    #         personalities.each do |personality|
    #             if u_personality == personality
    #                 personality_hash[:u_personality] += 1 
    #             end
    #         end
    #     end
    # end
end

def calculate_total_game_score
    # will add up the total game score
    # multiply by the percentage owned
    funds_score = @funds * @percentage_owned * 0.01
    empl_bonus = @employees.count * 1000
    prod_bonus = @products.count * 1000 * product_strength_total
    
    total_game_score = funds_score + empl_bonus + prod_bonus
    total_game_score.to_i
end

def improve_employees_morale(num, week)
    @employees.each do |employee|
        employee.increase_morale(num, week)
    end
end

def improve_employees_skill(num, week)
    @employees.each do |employee|
        employee.increase_skill(num, week)
    end
end

def improve_products(num, week)
    @products.each do |product|
        product.improve_product(num, week)
    end
end

end