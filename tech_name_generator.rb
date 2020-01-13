require 'pry'
require 'colorize'

## in order to give another script access to these variables I need to wrap
## in module. Also they must be constants.
module NamesVariables

NAMES1 = ["Face", "Pig", "Flat", "Duck", "Meme", "Dura", "Exo",
"You", "Table", "Scatter", "Slop", "Kumquot", "Purple", "Lovely",
"Micro", "App", "E -", "Bio", "Ameri"]

NAMES2 = ["Gizzard", "Camel", "Babies", "Tech", "Bay", "Book", "Iron", 
"Firm", "Vapes", "Capital"]


NAMES3 = ["Inc.", "and Co", "LLC", "", "", "" , ""]

end


def generate_name(slot_1, slot_2, slot_3)
    slot_1[rand(slot_1.count)] + " " + slot_2[rand(slot_2.count)] + " " +
    slot_3[rand(slot_3.count)]
end


# def choose_generated_name(names_1,names_2,names_3)
# new_name = generate_name(names_1,names_2,names_3)
# puts "---------------------------------------------------".green
# puts "                   #{new_name.blue}       "
# puts "---------------------------------------------------".green
# puts "Would you like to use this name?"
# puts " [1] - Yes      [2] - Generate Another"
# input = gets.chomp.to_i
#     if input == 2
#         choose_generated_name(names_1,names_2,names_3)
#     elsif input == 1
#         puts "Your new company name will be #{new_name.strip.green}!"
#         return new_name.strip
#     else 
#         puts "Please choose [1] or [2] and press enter."
#         choose_generated_name(names_1,names_2,names_3)
#     end
# end
