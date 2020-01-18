require_relative 'ui_design_module.rb'
include DesignModule
require 'colorize'
require 'pry'

class GameEvent

attr_accessor  :event_object, :week, :display, :color

@@gameclock = 1
@@all = []
def initialize(event_object, week, display, color = nil)
    @event_object = event_object
    @week = week
    if event_object
    @display = "#{event_object.name}" + " " + display
    else
        @display = display
    end
    @color = color
    # if color == red
    #     @display = @display.to_s.red
    # elsif color == blue
    #     @display = @display.to_s.blue
    # end

    @@all << self
end
def self.gameclock
    @@gameclock
end

def self.increment_game_clock(num)
    i = 0
    while i < num
    @@gameclock += 1 
    i += 1
    end
end

def self.all
    @@all
end

def self.weeks_events(week)
    @@all.select do |event|
        week == event.week
    end
end

def self.weeks_summary(week)
    
    weeks_events(week).each do |event|
        if event.event_object.class == Product
        puts LINE_SQUIGGLES_MEDIUM.blue
        puts event.display.blue
        puts LINE_SQUIGGLES_MEDIUM.blue
        else 
            if event.color == "red"
                puts LINE_SQUIGGLES_MEDIUM.red
                puts event.display.red
                puts LINE_SQUIGGLES_MEDIUM.red
            else
                puts LINE_SQUIGGLES_MEDIUM.green
                puts event.display.green
                puts LINE_SQUIGGLES_MEDIUM.green
            end
        end
        
    end
end

end