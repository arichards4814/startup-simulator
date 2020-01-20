require_relative '../config/environment.rb'

class UI

    attr_accessor :visual, :menu_items, :logic, :body, :header, :response, :final_output,
    :has_border, :border_type, :border_visual, :has_divider, :question_prompt, :return_value, :get_return_value, :parent_menu,
    :layout_type, :menu_items_unlocked
    attr_reader :menu_title

    @@all = []

    def initialize(menu_title)
        @menu_title = menu_title
        @menu_items = []
        @visual = ""
        @logic = []
        @has_border = false
        @menu_items_unlocked = [true, true, true, true, true, true]
        @@all << self
    end

    def self.all
        @@all
    end

    def visual 
        if @layout_type == "vertical"
            i = 0
            while i < (menu_items.count)
                if menu_items_unlocked[i]
                puts "   #{menu_items[i]}"
                else
                puts "   [#{i}] - ????????????" 
                end
                i += 1
            end
            return
        end


        if menu_items.count == 2 
            puts "   #{menu_items[0]}        #{menu_items[1]} "
        elsif menu_items.count > 2 && menu_items.count % 2 == 0 
            i = 0
            while i < ((menu_items.count / 2))
                
                if menu_items_unlocked[i]
                    left_item = menu_items[i]
                else 
                    left_item = "[#{i+1}] - ???????????       "
                end
                if menu_items_unlocked[i+(menu_items.count / 2)]
                    right_item = menu_items[i+(menu_items.count / 2)]
                else 
                    right_item = "[#{i+(menu_items.count / 2)+1}] - ???????????"
                end
                puts "   #{left_item}        #{right_item} "
                i += 1
            end
        elsif menu_items.count > 2 && !(menu_items.count % 2 == 0)
            ## odd number of menu_items
             i = 0
            while i < (((menu_items.count + 1) / 2) - 1)
                if menu_items_unlocked[i]
                    left_item = menu_items[i]
                else 
                    left_item = "[#{i+1}] - ???????????       "
                end
                if menu_items_unlocked[i+(menu_items.count / 2)]
                    right_item = menu_items[i+(menu_items.count / 2)]
                else 
                    right_item = "[#{i+(menu_items.count / 2)+1}] - ???????????"
                end
                puts "   #{left_item}        #{right_item} "
                i += 1
            end
                if menu_items_unlocked[-1]
                    final_item = menu_items[-1]
                else
                    final_item = "[#{menu_items.count}] - ???????????"
                end
                puts "   #{final_item}"
            binding.pry
        end
    end

    def set_logic(l1, l2 = method(:prompt), l3 = method(:prompt), l4 = method(:prompt), l5 = method(:prompt), l6 = method(:prompt),l7 = method(:prompt), l8 = method(:prompt), l9 = method(:prompt))
        logic << l1 
        logic << l2
        logic << l3
        logic << l4
        logic << l5
        logic << l6
        logic << l7
        logic << l8
        logic << l9
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

        if input == 1 && menu_items_unlocked[0] == true
            if @logic[0].class == Method || @logic[0].class == Proc
            @logic[0].call
            else
                @logic[0]
            end
        elsif input == 2 && menu_items_unlocked[1] == true
            if @logic[1].class == Method || @logic[1].class == Proc
                @logic[1].call
            else
                @logic[1]
            end
        elsif input == 3 && menu_items_unlocked[2] == true
            if @logic[2].class == Method || @logic[2].class == Proc
                @logic[2].call
            else
                @logic[2]
            end
        elsif input == 4 && menu_items_unlocked[3] == true
            if @logic[3].class == Method || @logic[3].class == Proc
                @logic[3].call
            else
                @logic[3]
            end
        elsif input == 5 && menu_items_unlocked[4] == true
            if @logic[4].class == Method || @logic[4].class == Proc
                @logic[4].call
            else
                @logic[4]
            end
        elsif input == 6 && menu_items_unlocked[5] == true
            if @logic[5].class == Method || @logic[5].class == Proc
                @logic[5].call
            else @logic[5]
                @logic[5]
            end
        elsif input == 7 && menu_items_unlocked[6] == true
            if @logic[6].class == Method || @logic[6].class == Proc
                @logic[6].call
            else @logic[6]
                @logic[6]
            end   
        elsif input == 8 && menu_items_unlocked[7] == true
            if @logic[7].class == Method || @logic[7].class == Proc
                @logic[7].call
            else @logic[7]
                @logic[7]
            end  
        elsif input == 9 && menu_items_unlocked[8] == true
            if @logic[8].class == Method || @logic[8].class == Proc
                @logic[8].call
            else @logic[8]
                @logic[8]
            end    
        elsif input.to_s == "back"
            if !:parent_menu
                puts "Cannot go back"
                self.prompt
            else
                @parent_menu.prompt
            end
        elsif input.to_s == "quit"
            exit
        elsif input.to_s == "h" || input.to_s == "help"||input.to_s == "-h"
            puts HELP.magenta
        
            UI.ask_for_enter
            self.prompt
        else
            UI.blank_space(5)
            puts "Option not available!".red
            UI.blank_space(5)
            self.prompt
        end

    end

    def prompt
        #this will puts out the visual
        #then will get input and return it
        #will make sure input is not blank
        UI.blank_space(5)
        build_border
        if @has_border 
            puts border_visual
        end
        puts @header
        if @has_divider
            puts border_visual
        end
        if @body.class == Method
        puts @body.call
        else
        puts @body
        end
        self.visual
        if @has_border
            puts border_visual
        end
        if @question_prompt.class == String
        puts @question_prompt
        elsif @question_prompt.class == Array
            @question_prompt.each do |ele|
                puts ele
            end
        end
        # get input from player
        input = gets.chomp
        if input == "back" || input == "quit" || input == "h" || input == "help"||input == "-h"
        else
            input = input.to_i
        end
        
        # make decision using that input about what method to run
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
        elsif @border_type == "squiggles-sm" || @border_type == "squiggles_sm"
            @border_visual = LINE_SQUIGGLES_SHORT
        elsif @border_type == "squiggles-md" || @border_type == "squiggles_md"
            @border_visual = LINE_SQUIGGLES_MEDIUM
        elsif @border_type == "squiggles-lg" || @border_type == "squiggles_lg"
            @border_visual = LINE_SQUIGGLES_LONG
        elsif @border_type == "equals-md" || @border_type == "equals_md"
            @border_visual = EQUALS_MEDIUM
        else 
            @border_visual = LINE_MEDIUM 
        end
    end

    def unlock_menu(num)
        ##takes 1 - 6 (or how ever many items there are and unlocks that choice)
        if num == 1
            menu_items_unlocked[0] = true
        elsif num == 2
            menu_items_unlocked[1] = true
        elsif num == 3  
            menu_items_unlocked[2] = true
        elsif num == 4
            menu_items_unlocked[3] = true
        elsif num == 5
            menu_items_unlocked[4] = true
        elsif num == 6
            menu_items_unlocked[5] = true
        end
    end

    def self.simple_question(question)
        ## prompts a question and returns the input
        puts LINE_MEDIUM
        puts question
        puts LINE_MEDIUM
        return gets.chomp
    end

    def self.billboard(str)
        total_dashes = 56
        final_array = []
        remaining_dashes = total_dashes - str.split(//).count
        i = 0
        while i < remaining_dashes / 2 
        final_array << "-"
        i += 1
        end

        str.split(//).each do |letter|
            final_array << letter
        end

        j = 0
        while j < remaining_dashes / 2 
        final_array << "-"
        j += 1
        end

        puts EQUALS_MEDIUM
        puts final_array.join
        puts EQUALS_MEDIUM
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