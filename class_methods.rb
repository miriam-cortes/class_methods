###################################
######      CLASS_REVIEW      #####
###################################
## INSTANCE VARIABLES
  # You know something's an instance variable bc of the "@" in front of its name
    # ex: name, username, password
## INSTANCE METHODS
  # These are behaviors of our class
    # ex: make a post, send message, create photo album
## INITIALIZE METHOD
  # def initialize ... You don't need it but it runs automatically when we initialize a new method
    # class User
    #   def initialize
    #     @name
    #   end
    #   def add_username(name)
    #     @name = name
    #   end
    # end
    # user1 = User.new
    # puts user1.methods


###################################
######  CLASS METHODS & SELF  #####
###################################
#Currently we have been creating classes expect many object to be created from them to utilize their functionality.
#With the help of the keyword 'self', we will have
###################################
######     LEARNING GOALS     #####
###################################
# Review what we've learned about classes so far:
    #Constructor (initialize)
    #Instance Methods
    #Attributes (stored in instance variables)
# Discover new functionality within classes:
    # Class Methods and self




# class Order
#   def initialize(subtotal, quantity) # <= instance method
#     @subtotal = subtotal
#     @quantity = quantity
#   end
#
#   def total # <= instance method
#     @subtotal * @quantity
#   end
#
#   def to_money # <= instance method
#     # in the line below, `total` is invoking the instance method above
#     "$" + sprintf("%0.02f", total / 100)
#   end
# end
#
# order = Order.new(1000, 2)
# order.to_money #=> $20.00


###################################
########    CLASS METHODS   #######
########     USING SELF     #######
###################################

#Class methods are called directly by the class and not by an instance of the class.
# Using self. allows class methods to happen

# class Kitten
#   def self.say_meow
#     return "meowwwwww"
#   end
# end
# puts Kitten.say_meow
 # because of the "self." we don't have to do kitten1 = Kitten.new and then do kitten1.say_meow



###################################
######    LETS TRY IT OUT!    #####
###################################

class Pawn
  attr_reader :position
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    pawns = []
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}") # this is how to create an object while inside the class it belongs to
    end

    pawns
  end
end
#
# #make one pawn
one_pawn = Pawn.new("A2")
# one_pawn is an object of the Pawn class
one_pawn.make_row("purple")
# This gives an error bc make_row is an undefined method...it's bc when we put "self." in front we can only call the instance method make_row on the Pawn class name
#
# #make a whole row of pawns
# pawns = Pawn.make_row("black")
#
# #What is being stored in this local variable pawns?
# puts pawns
#
# #WHAT IS THIS DOING!?
# puts pawns.shuffle.first.position
  #shuffle the pawns (objects) array, then take the first pawn (object) and give me the position of it


###################################
######   WHERE IS THIS USED?  #####
###################################
###Class methods are for anything that does not deal with an individual instance of a class##


#In Gems, like faker
  # https://github.com/stympy/faker/blob/master/lib/faker/hacker.rb

#When we get into databases, our data will be tied to a class. That class will have some premade class methods for us to use:  .find, .last, .where
#Those class methods allow you to find specific objects of that class based on an specified attributes of that class.
