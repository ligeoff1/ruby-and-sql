# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/1-models.rb
# cat log/development.log - this shows you all of the items in a file

# **************************
# Don't change or move - this deletes all rows in the company every time we run this file so we do not duplicate every time 
Company.destroy_all
# **************************

# 1a. check out the schema file
# 1b. check out the model file
puts "There are #{Company.all.count} companies" #Company.all.count = "SELECT COUNT (*) FROM companies" - basically what you are doing 

# 2. create new companies
# Create Company #1
values = {
    name:"Apple",
    url:"https://apple.com", 
    city: "Cupertino", 
    state: "CA"
}
company = Company.new(values) #just holding in memory and don't exist anywhere else, once done running if you dont save it'll disappear
company.save #actually inserting into a row on the table (enter into database) - connection back to SQL 
puts "There are #{Company.all.count} companies"

#Create Company #2
values = {
    name:"Amazon",
    url:"https://amazon.com", 
    city: "Seattle", 
    state: "WA"
}
company = Company.new(values)
company.save #insert into the database
puts "There are #{Company.all.count} companies"

#Create Company #3 - using a different way to assign values to a column 
company = Company.new
company.write_attribute(:name, "Tesla") 
company.write_attribute(:url, "https://tesla.com") 
company.write_attribute(:city, "Palo Alto") 
company.write_attribute(:state, "CA")
company.save
puts "There are #{Company.all.count} companies"

#OR another way to create 
#company.name = "Tesla"
#company.url = "https://tesla.com"
#company.city = "Palo Alto"
#company.state = "CA"
#company.save

# 3. query companies table
#puts Company.all.inspect the data is wrapped in square brackets (array) and each element in the arrays are basically a has  
#companies = Company.where({state:"CA"}) #adding a WHERE clause - state is the value we are searching by and the paranthesis is what viewing
#puts companies.inspect

puts Company.where({state:"CA", name:"Apple"}).count
apple = Company.where({state:"CA", name: "Apple"})[0] #adding a WHERE clause CA state companies with name apple, the brackers create the index. So saying show the very first instance where this is correct
puts apple.inspect 

# 4. read column values from row
puts apple.read_attribute(:url) #reruns value for that specific column/attribute 
puts "#{apple.read_attribute(:name)} has a website #{apple.read_attribute(:url)}"
puts "#{apple.name} has a website #{apple.url}"

# 5. update attribute value - adding a slogan
apple.write_attribute(:slogan, "Think Different.")
# OR YOU CAN USE: apple.slogan = "Think Different."
apple.save
puts apple.inspect

#6 deleting - saw you made incorrect row Tesler
tesler = Company.new({name: "Tesler"})
tesler.save
tesler.destroy 