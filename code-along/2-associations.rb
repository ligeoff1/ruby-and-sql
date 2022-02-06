# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-associations.rb

# 1. Query all of the contacts at Apple Inc.
apple = Company.where({name: "Apple"})[0]

#contacts = Contact.where({company_id: apple.id}) 
#We know that we are going to want to use ^^ this alot, so it is better to create an association between company/contacts within 
#the model. We are just copying this into the model so we can use .contacts 

contacts = apple.contacts
for contact in apple.contacts
    puts "#{contact.first_name} #{contact.last_name} - #{contact.email} - #{contact.company.name}"
end

# 2. add association to contacts in Company model



# 3. add association to company in Contact model
