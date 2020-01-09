class Startup

attr_accessor :funds, :pitch_level

def initialize(name)
    @name = name
    @pitch_level = 1
end

def increase_pitch(num)
    @pitch_level += num
end

def set_funds=(num)
    @setfunds = num
end

def increase_funds(num)
    @funds += num
end


end