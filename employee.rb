class Employee

    attr_accessor :salary, :job, :personality, :skill_level, :status

@@all = []

def initialize(name)

    personalities = ["Jovial", "Boisterous", "Soft Spoken", "Wild", "Power Hungry"]
salaries = [40000, 50000, 60000, 70000, 80000, 100000]
jobs = ["Programmer", "Sales"]

    @name = name
    @personality = personalities[rand(5)]
    @salary = salaries[rand(6)]
    @job = jobs[rand(2)]
    @status = "Looking for work"

    @@all << self
end


def hire
    @status = "Hired"
end

def self.all
    @@all
end



end