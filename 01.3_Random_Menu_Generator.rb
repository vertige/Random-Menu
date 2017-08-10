### Random Menu Generator

## Define method for Capitalizing each word after a space.
# Does not include words separated by hyphens, does not exclude small words such as "and", does not allow acronyms to remain all caps, does not allow initial small words (Example "*T*he Greatest of Stories: *A* First Voyage in the Land of Blah Blah"), and many such things. Could be improved within this definition one day...
# Is not the Titleize gem...
# Is to make code slightly more readable and experiment with method creation
# String#firstcap (because titleize is common and taken)
class String
  def firstcap; split.map(&:capitalize).join(' ') end # &:method notation is shorthand for do this over each item in array.
end

# Have the user determine number of menu options (Optional)
print "How many menu items would you like to create? "
user_no_items = gets.chomp.strip.to_i

# Check user input is an integer
attempts = 0

while user_no_items == 0 && attempts < 3
  print "That is an invalid response. How many menu items would you like to create? "
  user_no_items = gets.chomp.strip.to_i
  attempts += 1
end

if attempts == 3
  puts "Too many tries, you don't get to create a menu today. Take a nap and come back later"
  exit
end

# Have the user input food variables
if user_no_items == 1  #if they only want 1 menu item. Lame.

  puts "That's boring, but okay..."
  print "Pick an adjective: "
  adjectives = gets.chomp!.strip.firstcap

  # Check for numbers instead of words
  # [] Find way to shorten and reuse (create method?) code for other areas
  adj_tries = 0
  while adjectives.match? (/\d/)
    puts "That is not an adjective. Pick an adjective: "
    adjectives = gets.chomp!.strip.firstcap
    adj_tries += 1

    if adj_tries == 3
      puts "Too many tries, you don't get to create a menu today. Take a nap and come back later"
      exit
    end
  end


  print "Pick a method of cooking or food preparation: "
  food_prep = gets.chomp!.strip.firstcap

  print "Pick a food: "
  foods = gets.chomp!.strip.firstcap

else
  puts "Let's pick #{user_no_items} tasty adjectives about foods!"
  adjectives = Array.new

  user_no_items.times do |n|
    print "Adjective #{n + 1}: "
    adjectives << gets.chomp.strip.firstcap
  end

  puts "Let's pick #{user_no_items} cooking and food preparation methods!"
  food_prep = Array.new

  user_no_items.times do |n|
    print "Method #{n + 1}: "
    food_prep << gets.chomp.strip.firstcap
  end

  puts "Let's pick #{user_no_items} foods!"
  foods = Array.new

  user_no_items.times do |n|
    print "Food #{n + 1}: "
    foods << gets.chomp.strip.firstcap
  end

  # Randomize arrays
  adjectives.shuffle!
  food_prep.shuffle!
  foods.shuffle!
end

# Display menu items
if user_no_items == 1
  puts "Your lonely menu item is #{adjectives} #{food_prep} #{foods}. Enjoy!"
else
  puts "Awesome! Here are your menu options!"

  user_no_items.times do |menu_item|
    puts "Menu Item #{menu_item + 1}: #{adjectives[menu_item]} #{food_prep[menu_item]} #{foods[menu_item]}"
  end
end

### Prompt
# Create a program that runs from the Terminal that will create a random menu based on several items that you determine.
#
### Baseline
# Come up with the three arrays of ten items each. Each list should be a different type of food or descriptor for that food.
# For example, the first array can contain adjectives, the second, cooking styles and the third, foods. If this was the array selection, it could create a few items like:
#
# hot pan-fried dumplings
# soft steamed clams

### Primary Requirements
# Create a random menu generator that can be played from the Terminal.
# Your generator should pull one item from each array you made in the baseline requirements to create a "menu item".
# When the program runs, it should create and show a list of ten numbered menu items.

### Test & Verify
# Make sure you run your program and ensure it's working. Among your tests ensure that:
# [X] The menu items are selected randomly.
# [see below] There are 10 menu items.
# [X] Each item should pull one word from each of the 3 arrays.
# [X] The items are numbers 1-10 (not starting at zero).
# [X] Run the program a few times and ensure that the last word in the arrays are used. Also ensure that the first word in the arrays are used at least occasionally.

### Optional Enhancements
# [X] Expand your solution to ensure that no descriptive term in a menu item is ever repeated. So if the first menu item is hot pan-fried dumplings, the the phrases hot, pan-friend and dumpling cannot individually be used in any other menu items.
# [X] Expand your solution to allow the user to determine how many items they'd like to see via user input. Note: You will need to ensure that this user-chosen number of items is not larger than the number of items you have in your arrays.
# [X] Instead of using hardcoded or predefined arrays, make your program accept user input. This user input will be utilized to generate the menu items. You'll need to prompt for and store a varying number of entries for each food-type array.
