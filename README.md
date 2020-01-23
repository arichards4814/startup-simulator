# STARTUP SIMULATOR
## Like lemonade stand but way more advanced.

What you need....
If you do not have the gem 'colorize' please make sure to install it. 
If you don't use the ruby gem 'pry' I also recommend you use it.
Run Bundler to install.

Thanks for taking a look at Startup Simulator and the Tiny Game Engine (TGE). 
Tiny Game Engine is a UI and game design system created to make building games
in the command line easy!!! I encourage you to fork and use the Tiny Game Engine
and try to build your own games! 

Create by Andrew Richards - github: arichards4814

# PLAYING STARTUP SIMULATOR

To play the game simply use 'ruby run.rb' and that's it!!!!

The object of the game is to raise money, build your business, hire employees, create products and so on. There are many things to worry about... to check them visit the view company panel. There you will see your average employee morale, product strength etc. Make sure to keep improving on these things. 

BE CAREFUL! If you start building products that your team can't handle they will lose morale!

As you move through the game you will see menu items that are not unlocked yet shown as '[2] ??????????'. These are in the game! You just have to improve your companies recognition and the amount of employees you have to see these!

A few commands when you are in the menus:
[back] - type back and press enter/return to return to the previous menu
[help] - type back and press enter/return to view the help menu
[quit] - type quit and press enter/return to quit the game completely


# USING THE TINY GAME ENGINE:

The Tiny Game Engine was created as a way for Ruby developers to build games in the command line and not have to worry too much about menus.

## Building your menus with the UI class

In order to use menus, follow these steps:

1. Initialize a menu, usually I call my first menu 'main menu'. I'm so original.
2. Set the menu items, has_border, border_type, and 
3. Set the parent_menu... this will be the menu that your player is brought to when he types 'back'
    - important note! Your first menu should have itself as the parent menu... otherwise the game will break.

Take a look at my example here:

```
    main_menu_ui = UI.new("main_menu_ui")
    main_menu_ui.menu_items = ["[1] - Try to Raise Capital  ", "[2] - Hire Employees        ", "[3] - Build/Improve Products",
                            "[4] - View Company", "[5] - View Employees", "[6] - View Products"]
    main_menu_ui.header = "                               MAIN MENU - Week: #{week}"
    main_menu_ui.body = "            #{our_startup.name}\n Funds: $#{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    main_menu_ui.has_border = true
    main_menu_ui.border_type = "dash-lg"
    main_menu_ui.has_divider = true
    main_menu_ui.parent_menu = main_menu_ui
```

![The menu above when calling main_menu_ui.prompt ](https://github.com/arichards4814/startup-simulator/blob/master/images/SUS_Screen.png)


4. Once you initialize all of your menus, it's time to set your logic!!! To do so, in your file create a new area (after initializing all of your menus) to set all of your menu logic. 
    - use the .set_logic instance method to store the methods you want to run when that menu item is chosen. for example you would store 'main_menu.method(:prompt)' if you want that item to go back to the main menu. The .prompt method on a UI object will always prompt the menu and ask for input.

5. Once you have set up your logic, test your logic by calling main_menu.prompt and watch the magic happen!



## Using GameEvent and GameTrigger


I will be updating this section very soon! Keep your eye out!




### Pass the current strings as a parameter in #border_type to create that border. #has_border must be set to true for border to show
* border types - dash-sm, dash-md, dash-lg, line-sm, line-md, line-lg, carrot-sm, carrot-md, carrot-lg, squiggles-sm, squiggles-md,squiggles-lg, equals-md

### Try using these class methods to puts out a title card: 
* UI.billboard(string)
* UI.announce(string)

### To simply ask for enter, use the '.ask_for_enter' class method
* UI.ask_for_enter

### To ask a question and return its response, use '.simple_question' class method
* UI.simple_question(string)

### to add space use the '.blank_space' class method passing a number of blank lines as a parameter
* UI.blank_space(integer)







# STARTUP SIMULATOR FEATURES

## TECH NAME GENERATOR (tech_name_generator.rb)
Generates a random tech name for your company

## Menu Tree
- main_menu
    * raise_money
    * hire_employees
        - employee_choice
    * build/improve products
        - build
        - improve
    * company info
    * employee info




# TINY GAME ENGINE (TGE) FEATURES

## UI Creator (UI.rb)
Allows you to build out robust, styled menus. 
- eventually want to be able to create logos with ASCII text

## Game Events (gameevent.rb)
- GameEvent class that stores game events. 
- Class method that puts out your game events on each turn.


## (Eventually) Gameobject Class (gameobject.rb)
Will allow you to build player characters, enemy characters.

## (Eventually) Story Class (story.rb)
Will allow you to build stories with decision making branches that effect the direction of the story.

## Additions - Tiny Game Engine

- [x] add help menu
- [] custom error handling
- [x] ability to have an odd number of menu items
- [] ability to have up to 9 numbers of menu items
- [x] additional borders included
- [x] instructions in the readme
- [] metaprogram menu creator, making building menu trees easy.

## Additions - Startup Simulator
- [x] finish 4th menu - view company
- [x] add improve employee function
- [x] add improve product function
- [x] add raise money from other investors functions
- [] code in employee personality bonuses





JERRY FOUND A BUG... CANNOT RUN BUNDLE 
JERRY FOUND A BUG... CANNOT UNLOCK FINAL PRODUCT!!
ADAM FOUND A BUG... 