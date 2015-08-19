# SlotMachine

Creating a slot machine game from the bitfountain iOS 8 course.

Project Outline:

Setting and connecting the storyboard elements, which includes: (We recommend making all the views and such in code, to get a better Labels Buttons UIImages Anything else you want to add or think the app needs..

* Create 4 Container Views that will handle our different UI interactions. (See screenshot for a reference!)
    * FirstContainerView = Title View. This should contain our title label.
    
    * SecondContainerView = Biggest of the 4. Will contain the 9 UIImageViews, that will randomly generate card slots.
    
    * ThirdContainerView = Directly below the card slots, and will contain 3 Labels that display: “Credits” (how many credits         the     user currently has) “Bet” (how much the user is currently betting) “Winner Paid” (how much the user was paid on       the last        spin)
    
    * FourthContainerView = Will contain 4 UIButons that will read:
      * “Reset” (which will reset the game)
      * “Bet One” (which will add one to the bet amount)
      * “Bet Max” (which will add 5 to the bet amount)
      * “Spin” (Which will initiate spinning the slots).

* Create a Factory Class that will randomly generate our slot every time we hit the “Spin” button.

**Hint**: Break up the 9 ImageViews into 3 Arrays of 3 images each. This will make it easier to manipulate. Also, create an object for the cards, so you are able to give it properties, such as Red or Black, numberValue, name,…
For whatever ImageView
Have your application compute the winnings for each round of the spin.
Update your view to display all new card images, Credits, Bet, Winner Paid Values.
