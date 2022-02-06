class Company < ApplicationRecord
    has_many :contacts 
    
    #def contacts
    #    Contact.where({company_id: id})
    #end

end
