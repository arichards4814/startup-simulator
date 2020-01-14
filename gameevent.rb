require_relative 'ui_design_module.rb'
include DesignModule
require 'colorize'
require 'pry'

class GameEvent

attr_accessor  :event_object, :week, :display

@@all = []
def initialize(event_object, week, display)
    @event_object = event_object
    @week = week
    if event_object
    @display = "#{event_object.name}" + " " + display
    else
        @display = display
    end

    @@all << self
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
        puts LINE_SQUIGGLES_MEDIUM.green
        puts event.display.green
        puts LINE_SQUIGGLES_MEDIUM.green
        end
    end
end

end