# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/0-classes.rb

# String Class
bens_favorite_food = "sushi"
puts bens_favorite_food.upcase #every string has these shared features like upcase 
puts bens_favorite_food.class

brians_favorite_food = "tacos"
puts brians_favorite_food.upcase

number_of_tacos = 5
puts number_of_tacos
puts number_of_tacos.class

# String Methods

# Custom Class
class Dog
    def speak
        puts "Woof"
    end
end

jenkins = Dog.new #gives us a new instance/object from this class
puts jenkins.class
puts jenkins.speak


lassie = Dog.new
puts lassie.speak