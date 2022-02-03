# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/1-models.rb

# **************************
# Don't change or move
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

puts "Contacts: #{Contact.all.count}"
contacts = Contact.all
for contact in contacts
        puts "#{contact.first_name} #{contact.last_name} - #{contact.email}"
end

#efficient way to do it - loop!
