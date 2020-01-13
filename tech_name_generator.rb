require 'pry'
require 'colorize'

## in order to give another script access to these variables I need to wrap
## in module. Also they must be constants.
module NamesVariables

NAMES1 = ["Face", "Pig", "Flat", "Duck", "Meme", "Dura", "Exo",
"You", "Table", "Scatter", "Slop", "Kumquot", "Purple", "Lovely",
"Micro", "App", "E -", "Bio", "Ameri", "Quantum", "Logi", "Imagi"]

NAMES2 = ["Gizzard", "Camel", "Babies", "Tech", "Bay", "Book", "Iron", 
"Firm", "Vapes", "Capital", "Ware", "Soft"]


NAMES3 = ["Inc.", "and Co", "LLC", "", "", "" , ""]

end


def generate_name(slot_1, slot_2, slot_3)
    slot_1[rand(slot_1.count)] + " " + slot_2[rand(slot_2.count)] + " " +
    slot_3[rand(slot_3.count)]
end

