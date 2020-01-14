require_relative 'ui_design_module.rb'
require_relative 'tech_name_generator.rb'
include NamesVariables
include DesignModule


class UI

    attr_accessor :visual, :menu_items, :logic, :body, :header, :response, :final_output,
    :has_border, :border_type, :border_visual, :has_divider, :question_prompt, :return_value, :get_return_value, :parent_menu,
    :layout_type
    attr_reader :menu_title

    @@all = []

    def initialize(menu_title)
        @menu_title = menu_title
        @menu_items = []
        @visual = ""
        @logic = []
        @has_border = false
        @@all << self
    end

    def self.all
        @@all
    end

    def visual 
        if @layout_type == "vertical"
            i = 0
            while i < (menu_items.count)
                puts "   #{menu_items[i]}"
                i += 1
            end
            return
        end
        if menu_items.count == 2 
            puts "   #{menu_items[0]}        #{menu_items[1]} "
        else 
            i = 0
            while i < (menu_items.count / 2)
                puts "   #{menu_items[i]}        #{menu_items[i+3]} "
                i += 1
            end
        end
    end

    def set_logic(l1, l2 = method(:prompt), l3 = method(:prompt), l4 = method(:prompt), l5 = method(:prompt), l6 = method(:prompt))
        logic << l1 
        logic << l2
        logic << l3
        logic << l4
        logic << l5
        logic << l6
    end

    def get_input(input)
        # this will decide when 1 - 6 is pressed what happens
        # if user pressed 1 during prompt, l1 will happen
        # if user pressed 2 during prompt, l2 will happen 
        # (and so on)

        if @logic[0] == "store_response"
            return input
        end

         if @logic[0] == "return_value"
            @return_value
        end

        if input == 1
            if @logic[0].class == Method
            @logic[0].call
            elsif @logic[0].class == Proc
                @logic[0].call
            else
                @logic[0]
            end
        elsif input == 2
            if @logic[1]
                @logic[1].call
            elsif @logic[1].class == Proc
                @logic[1].call
            end
        elsif input == 3
            if @logic[2]
                @logic[2].call
            elsif @logic[2].class == Proc
                @logic[2].call
            end
        elsif input == 4
            if @logic[3]
                @logic[3].call
            end
        elsif input == 5
            if @logic[4]
                @logic[4].call
            end
        elsif input == 6
            if @logic[5]
                @logic[5].call
            end
        elsif input.to_s == "back"
            if !:parent_menu
                puts "Cannot go back"
                self.prompt
            else
                @parent_menu.prompt
            end
        else
            self.prompt
        end

    end

    def prompt
        #this will puts out the visual
        #then will get input and return it
        #will make sure input is not blank
        build_border
        if @has_border 
            puts border_visual
        end
        puts @header
        if @has_divider
            puts border_visual
        end
        puts @body
        self.visual
        if @has_border
            puts border_visual
        end
        puts @question_prompt
        input = gets.chomp
        if input == "back"
        else
            input = input.to_i
        end
        get_input(input)
        if @response
            puts @response
        end
        
        #self.get_input
    end

    def self.announce(dialogue, color = nil)
        if !color
            puts LINE_MEDIUM
            puts dialogue
            puts LINE_MEDIUM
        elsif color == "green"
            puts LINE_MEDIUM.green
            puts dialogue.green
            puts LINE_MEDIUM.green
        elsif color == "red"
            puts LINE_MEDIUM.red
            puts dialogue.red
            puts LINE_MEDIUM.red
        elsif color == "blue"
            puts LINE_MEDIUM.blue
            puts dialogue.blue
            puts LINE_MEDIUM.blue
        end
        puts ("[Press enter to continue...]")
        gets.chomp
    end

    def self.ask_for_enter
        puts ("[Press enter to continue...]")
        gets.chomp
    end

    def self.blank_space(int)
        i = 0

        while i < int
            puts ""
            i += 1
        end
    end

    def build_border
        if @border_type == "dash-sm" || @border_type == "dash_sm"
            @border_visual = DASH_SHORT
        elsif @border_type == "dash-md" || @border_type == "dash_md"
            @border_visual = DASH_MEDIUM
        elsif @border_type == "dash-lg" || @border_type == "dash_lg"
            @border_visual = DASH_LONG
        elsif @border_type == "carrot-sm" || @border_type == "carrot_sm"
            @border_visual = LINE_CARROT_SHORT
        elsif @border_type == "carrot-md" || @border_type == "carrot_md"
            @border_visual = LINE_CARROT_MEDIUM
        elsif @border_type == "carrot-lg" || @border_type == "carrot_lg"
            @border_visual = LINE_CARROT_LONG
        else 
            @border_visual = LINE_MEDIUM
        end
    end

    def self.simple_question(question)
        ## prompts a question and returns the input
        puts LINE_MEDIUM
        puts question
        puts LINE_MEDIUM
        return gets.chomp

    end

    ## Added specifically for Startup Simulator ## Not included in Tiny Game Engine ##
    ## should use a module for this and include these????
    def generate_name_ui
        generate_name(NAMES1,NAMES2,NAMES3)
    end

    def prompt_generate
        #this will puts out the visual
        #then will get input and return it
        #will make sure input is not blank
        build_border
        if @has_border 
            puts border_visual
        end
        new_name_generated = generate_name_ui
        @return_value = new_name_generated
        @header = (new_name_generated.blue)
        puts @header
        if @has_divider
            puts border_visual
        end
        puts @body

        self.visual
        if @has_border
            puts border_visual
        end
        puts @question_prompt
        input = gets.chomp.to_i
        get_input(input)
        if @response
            puts @response
        end
        
        #self.get_input
    end

    def get_return_value
        puts "What would you like to call your company?"
        @return_value = gets.chomp
    end

    
end