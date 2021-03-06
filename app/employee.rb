
require_relative '../config/environment.rb'


class Employee

    attr_accessor :name, :salary, :job, :personality, :skill_level, :status, :morale
    
@@all = []

def initialize(name)

    personalities = ["Jovial", "Boisterous", "Soft Spoken", "Wild", "Power Hungry"]
    salaries = [40000, 50000, 60000, 70000, 80000, 100000]
    jobs = ["Programmer", "Sales"]

    @name = name
    @personality = personalities[rand(5)]
    @salary = salaries[rand(6)]
    @job = jobs[rand(2)]
    @status = "looking for work"
    @skill_level = rand(3)
    @morale = 7

    @@all << self
end

def self.all
    @@all
end

def increase_skill(num, current_week)
    @skill_level += num
    if @skill_level > 10
        @skill_level = 10
    else
    GameEvent.new(nil,current_week, "Your employee #{self.name}'s skill has increased.", "green")
    end
end

def increase_morale(num, current_week)
    @morale += num
    if @morale > 10
        @morale = 10
    else
        GameEvent.new(nil,current_week, "Your employee #{self.name}'s morale has increased.", "green")
    end
end

def decrease_morale(num, current_week)
    @morale -= num
    if @morale < 0
        @morale = 0
    else
        GameEvent.new(nil,current_week, "Your employee #{self.name}'s morale has dropped.", "red")
    end
end

def self.three_emps
    three_emps = []
    if @@all.count < 3
        puts "Error: There are less than 3 employees initialized."
        return
    end
   
    i = 0

    until three_emps.count == 3 || i == 50
        random_pick = rand(self.all.count)
        if self.all[random_pick].status == "looking for work" && !three_emps.include?(self.all[random_pick])
            three_emps << @@all[random_pick]
        end
        i += 1
    end

    if !three_emps
        puts "There are no employees available for hire."
    end
    three_emps
end





end