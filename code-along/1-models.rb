# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/1-models.rb
# cat log/development.log - this shows you all of the items in a file

# **************************
# Don't change or move
Company.destroy_all
# **************************

# 1a. check out the schema file
# 1b. check out the model file
puts "There are #{Company.all.count} companies" #Company.all.count = "SELECT COUNT (*) FROM companies" - basically what you are doing 

# 2. create new companies
values = {
    name:"Apple",
    url:"https://apple.com", 
    city: "Cupertino", 
    state: "CA"
}

company = Company.new(values)
company.save #insert into a row on the table (enter into database)/hold this in memory 
puts "There are #{Company.all.count} companies"

values = {
    name:"Amazon",
    url:"https://amazon.com", 
    city: "Seattle", 
    state: "WA"
}

company = Company.new(values)
company.save #insert into the database
puts "There are #{Company.all.count} companies"


company = Company.new
company.write_attribute(:name, "Tesla") # or company.name = "Tesla"
company.write_attribute(:url, "https://tesla.com") # or company.url = "https://tesla.com"
company.write_attribute(:city, "Palo Alto") 
company.write_attribute(:state, "CA")
company.save
puts "There are #{Company.all.count} companies"

# 3. query companies table
#puts Company.all.inspect #creates arrays, and basically a hash 

#companies = Company.where({state:"CA"}) #adding a WHERE clause - state is the value we are searching by and the paranthesis is what viewing
#puts companies.inspect

apple = Company.where({state:"CA", name: "Apple"})[0] #adding a WHERE clause CA state companies with name apple, the brackers create the index. So saying show the very first instance where this is correct
puts apple.inspect 

# 4. read column values from row
puts apple.read_attribute(:url) #retruns value for that specifict column/attribute 
puts "#{apple.name} has a website: #{apple.url}"


# 5. update attribute value - adding a slogan
apple.write_attribute(:slogan, "Think Different.")
# OR YOU CAN USE: apple.slogan = "Think Different."
apple.save
puts apple.inspect

#6 deleting - saw you made incorrect row Tesler
tesler = Company.new({name: "Tesler"})
tesler.save
tesler.destroy 