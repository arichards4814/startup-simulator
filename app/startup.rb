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
        if employees.count > 1
        GameEvent.new(nil, week, "Your employee(s) have not been paid... their morale has dropped tremendously.", "red")
        else
        GameEvent.new(nil, week, "Your employee has not been paid... their morale has dropped tremendously.", "red")
        end
    end
end


end