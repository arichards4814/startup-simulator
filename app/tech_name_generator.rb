require 'pry'
require 'colorize'

## in order to give another script access to these variables I need to wrap
## in module. Also they must be constants.
module NamesVariables

NAMES1 = ["Face", "Pig", "Flat", "Duck", "Meme", "Dura", "Exo",
"You", "Table", "Scatter", "Slop", "Kumquot", "Purple", "Lovely",
"Micro", "App", "E -", "Bio", "Ameri", "Quantum", "Logi", "Imagi", "Gator",
"Elephant", "Mongoose", "Tiny", "Loud", "Humongous"]

NAMES2 = ["Gizzard", "Camel", "Babies", "Tech", "Bay", "Book", "Iron", 
"Firm", "Vapes", "Capital", "Ware", "Soft"]


NAMES3 = ["Inc.", "and Co", "LLC", "", "", "" , ""]

end

module NamesVariablesMenWomen

    MALE_FIRST = ["Liam", "Noah", "William", "James", "Oliver", "Benjamin", "Elijah", "Lucas", "Mason", "Logan", "Alexander", "Ethan", "Jacob", "Michael", "Daniel", "Henry", "Jackson", "Sebastian", "Aiden", "Matthew", "Samuel", "David", "Joseph", "Carter", "Owen", "Wyatt", "John", "Jack", "Luke", "Jayden", "Dylan", "Grayson", "Levi", "Issac", "Gabriel", "Julian", "Mateo", "Anthony", "Jaxon", "Lincoln", "Joshua", "Christopher", "Andrew", "Theodore", "Caleb", "Ryan", "Asher", "Nathan", "Thomas", "Leo", "Isaiah", "Charles", "Josiah", "Hudson", "Christian", "Hunter", "Connor", "Eli", "Ezra", "Aaron", "Landon", "Adrian", "Jonathan", "Nolan", "Jeremiah"]

    FEMALE_FIRST =["Emma", "Olivia", "Ava", "Isabella", "Sophia", "Charlotte", "Mia", "Amelia", "Harper", "Evelyn", "Abigail", "Emily", "Elizabeth", "Mila", "Ella", "Avery", "Sofia", "Camila", "Aria", "Scarlett", "Victoria", "Madison", "Luna", "Grace", "Chloe", "Penelope", "Layla", "Riley", "Zoey", "Nora", "Lily", "Eleanor", "Hannah", "Lillian", "Addison", "Aubrey", "Ellie", "Stella", "Natalie", "Zoe", "Leah", "Hazel", "Violet", "Aurora", "Savannah", "Audrey", "Brooklyn", "Bella", "Claire", "Skylar", "Lucy", "Paisley", "Everly", "Anna", "Caroline", "Nova", "Genesis", "Emilia", "Kennedy", "Samantha"]

    # MALE_TITLES = ["Uncle"]
    # FEMALE_TITLES = ["Aunt"]

end

module ProductNameVariables

    ARTICLE = ["The", "That", "", ""]

    NOUN = [
"rings",
"jam",
"pipe",
"lake",
"walk",
"linen",
"meal",
"knowledge",
"board",
"woman",
"error",
"flight",
"cup",
"limit",
"fog",
"cake",
"vacation",
"bird",
"activity",
"cloth",
"wrist",
"feeling",
"mother",
"parcel",
"harbor",
"believe",
"mind",
"battle",
"stone",
"gun",
"calendar",
"cream",
"way",
"cabbage",
"women",
"bushes",
"profit",
"pie",
"snake",
"pigs",
"foot",
"grandmother",
"bone",
"dolls",
"card",
"jail",
"bikes",
"pancake",
"shoe",
"zephyr",
"amount",
"tank",
"rain",
"trail",
"top",
"pets",
"stamp",
"kiss",
"table",
"stick",
"hospital",
"request",
"birds",
"boy",
"cook",
"mint",
"suit",
"downtown",
"robin",
"current",
"houses",
"door",
"hose",
"girls",
"page",
"tiger",
"interest",
"dinner",
"story",
"size",
"advertisement",
"needle",
"silk",
"scarf",
"fly",
"haircut",
"picture",
"apparatus",
"power",
"jelly",
"crate",
"earthquake",
"trucks",
"sound",
"society",
"sleet",
"rabbit",
"distance",
"snow",
"chalk"
    ]
    VERB_W_ER =
["rager",
"cuddler",
"exciter",
"refactorer",
"delister",
"clacker",
"blackmailer",
"blogger",
"dognapper",
"winner",
"assembler",
"babbler",
"babyproofer",
"contextualizer",
"exerciser",
"eraser",
"epitomizer",
"exploder",
"delister",
"decoder",
"deleter",
"devourer",
"hypnotizer"]



HELP = "HELP MENU \n\n
Thank you for playing Startup Simulator created with\n
tools from the Tiny Game Engine. I built the Tiny Game\n
Engine to give ruby developers an easy way to build a\n
menu system and game event system for your game - Andrew\n\n
------------STARTUP SIMULATOR TIPS AND TRICKS-----------\n
To go back to the previous menu type 'back' and press enter\n
\n 
To quit the game entirely type 'quit' in a menu and press enter\n
\n 
Every time you raise money you give up equity in the company for\n
a dollar value. The more you own at the end of the game the higher\n
your score.\n\n 
By raising your 'Recognition' you unlock the ability to raise money\n
from more investors.\n\n
Your employee personalities matter. Try to combine or diversify to \n
and see what happens."


end


def generate_product_name(article, noun, verb)
    article[rand(article.count)] + " " + noun[rand(noun.count)] + " " + verb[rand(verb.count)]
end

def generate_name(slot_1, slot_2, slot_3)
    slot_1[rand(slot_1.count)] + " " + slot_2[rand(slot_2.count)] + " " +
    slot_3[rand(slot_3.count)]
end



