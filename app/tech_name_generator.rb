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



HELP = "--------------------------------------------------------
\n

================================================================\n
---------------------------HELP MENU-----------------------------\n
================================================================\n\n\n
Thank you for playing Startup Simulator created with\n
tools from the Tiny Game Engine. Tiny Game Engine was built to \n
give ruby developers an easy way to build a menu system and game\n
event system for your game! - Andrew\n\n
================================================================\n
---------------------NAVIGATING THE MENUS-----------------------\n
================================================================\n
[back] - To go back to the previous menu type 'back' and press\n
enter.\n 
[quit] - To quit the game entirely type 'quit' in a menu and press \n
enter.\n 
[1-9] - choose a menu item by typing the number and pressing enter\n

================================================================\n
---------------STARTUP SIMULATOR TIPS AND TRICKS--------------\n
================================================================\n
+Every time you raise money you give up equity in the company \n
for a dollar value. The more you own at the end of the game the \n
higher your score.\n\n 
+By raising your 'Recognition' you unlock the ability to raise \n
money from more investors.\n\n
+Your employee personalities matter. Try to combine or diversify \n
and see what happens.\n\n
+More employees on your team will help your products be built \n
faster. \n\n
+Your employee skill will create products with better product \n
strength. \n\n
+The more programmers you have, the faster your products will be \n
built. \n\n
+The more sales people you have, the more products you will sell.\n
+Your employees' morale will rise whenever you hire a new employee.\n
\n \n
+ The menu items with question marks: '??????????' are unlockable\n
increase your recognition, hire employees and grow your company \n
to unlock these options! \n\n
^^^^^^^^^^^^^^^^^^^^ SCROLL UP TO SEE MORE ^^^^^^^^^^^^^^^^^^^^^^^\n
-----------------------------------------------------------"


end


def generate_product_name(article, noun, verb)
    article[rand(article.count)] + " " + noun[rand(noun.count)] + " " + verb[rand(verb.count)]
end

def generate_name(slot_1, slot_2, slot_3)
    slot_1[rand(slot_1.count)] + " " + slot_2[rand(slot_2.count)] + " " +
    slot_3[rand(slot_3.count)]
end



