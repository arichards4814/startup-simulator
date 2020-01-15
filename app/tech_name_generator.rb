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


def generate_name(slot_1, slot_2, slot_3)
    slot_1[rand(slot_1.count)] + " " + slot_2[rand(slot_2.count)] + " " +
    slot_3[rand(slot_3.count)]
end

