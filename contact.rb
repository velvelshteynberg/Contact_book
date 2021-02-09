gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text


  def full_name
  "#{@first_name} #{@last_name}"
  end


  
end

Contact.auto_upgrade!


# devorah = Contact.create("Devorah","shteynberg", "devorahshteynberg@devorah.com", "amazing day")
# velvel = Contact.create("Velvel", "shteynberg", "velvelshteynberg@velvel.com", "fabulous day")
# p Contact.all
# p "====================="
# p Contact.find(2)
# p "====================="
# p devorah.update("note", "AMAZING DAY")
# p "====================="
# p Contact.find_by("first_name", "Velvel")
# p "====================="
# # p Contact.delete_all
# p "====================="
# p velvel.full_name
# p "====================="
# p velvel.delete





