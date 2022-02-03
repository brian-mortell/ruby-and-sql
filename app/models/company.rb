class Company < ApplicationRecord
    has_many :contacts  
end

# def contacts
    #     Contact.where({company_id: id})
    # end