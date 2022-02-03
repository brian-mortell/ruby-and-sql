# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-associations.rb

Contact.destroy_all
# **************************

# 1a. check out the schema file
# 1b. check out the model file
apple = Company.where({name: "Apple"})[0]
puts apple.id
amazon = Company.where({name: "Amazon"})[0]
puts amazon.id
tesla = Company.where({name: "Tesla"})[0]
puts tesla.id

# 2. create 1-2 new contacts for each company (they can be made up)

contact = Contact.new
contact.first_name = "Andy"
contact.last_name = "Jassy"
contact.email = "andy@amazon.com"
contact.company_id = amazon.id
contact.save

contact = Contact.new
contact.first_name = "Craig"
contact.last_name = "Federighi"
contact.email = "craig@apple.com"
contact.company_id = apple.id
contact.save

contact = Contact.new
contact.first_name = "Elon"
contact.last_name = "Musk"
contact.email = "elon@tesla.com"
contact.company_id = tesla.id
contact.save

contact = Contact.new
contact.first_name = "Tim"
contact.last_name = "Cook"
contact.email = "tim@apple.com"
contact.company_id = apple.id
contact.save

# 3. write code to display how many contacts are in the database AND each contact's info (name, email), e.g.:
# andy = Contact.where({first_name: "Andy"})[0]
# craig = Contact.where({first_name: "Craig"})[0]
# elon = Contact.where({first_name: "Elon"})[0]
# tim = Contact.where({first_name: "Tim"})[0]

# puts "Contacts: #{Contact.all.count}"
# puts "#{andy.first_name} - #{andy.email}"
# puts "#{craig.first_name} - #{craig.email}"
# puts "#{elon.first_name} - #{elon.email}"
# puts "#{tim.first_name} - #{tim.email}"

#inefficient way to do it

# ---------------------------------
# Contacts: 4
# Andy Jassy - andy@amazon.com
# Craig Federighi - craig@apple.com
# Elon Musk - elon@tesla.com
# Tim Cook - tim@apple.com

# puts "Contacts: #{Contact.all.count}"
# contacts = Contact.all
# for contact in contacts
#         puts "#{contact.first_name} #{contact.last_name} - #{contact.email}"
# end

#efficient way to do it - loop!

# 1. write code to display each contact (you can reuse the previous lab's code) and include the contact's company name, e.g.:
# apple = Company.where({name: "Apple"})[0]

# contacts = apple.contacts

# for contact in contacts
#     puts "#{contact.first_name} #{contact.last_name} - #{contact.email} - #{contact.company.name}"
# end

puts "Contacts: #{Contact.all.count}"
contacts = Contact.all
for contact in contacts
        puts "#{contact.first_name} #{contact.last_name} - #{contact.email} - #{contact.company.name}"
end

# ---------------------------------
# Contacts: 4
# Andy Jassy - andy@amazon.com - Amazon.com, Inc.
# Craig Federighi - craig@apple.com - Apple Inc.
# Elon Musk - elon@tesla.com - Tesla, Inc.
# Tim Cook - tim@apple.com - Apple Inc.

# 2. similar to above, but this time organized by company, write code to display each company (name) and its contacts, e.g.:

# ---------------------------------
# Apple Inc.
# Tim Cook - tim@apple.com
# Craig Federighi - craig@apple.com
#
# Amazon.com, Inc.
# Andy Jassy - andy@amazon.com
#
# Tesla, Inc.
# Elon Musk - elon@tesla.com

companies = Company.all

for company in companies
    puts company.name
    contacts = company.contacts
    for contact in contacts
    puts "#{contact.first_name} #{contact.last_name} - #{contact.email}"
    end
    puts ""
end
