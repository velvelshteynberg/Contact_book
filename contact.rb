class Contact

  @@all_contacts = []
  @@id = 1


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @note = note
      @id = @@id
      @@all_contacts << self
      @@id += 1
  end

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@all_contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@all_contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@all_contacts.each do |individual_contact|
      if @id == "id"
        return individual_contact
      end 
    end
end
#the id part is not shifting for each new contact. not sure why not

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
 
  # def update(value_being_changed)
  #   def setter
  #     @value_being_changed
  #   end 
  #   "What would you liked to change this value to?"
  #   user_input = gets.chomp
  #   Contact.@value_being_changed = "user_input"
  #   return Contact
  # end 

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@all_contacts.each do |individual_contact|
    if @attribute == "value"
      return individual_contact
      #not working
    end 
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@all_contacts.clear
    @@all_contacts
  end

  def full_name
  @first_name + @last_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(index_position_of_value)
    @@all_contacts.delete_at(index_position_of_value)
    @@all_contacts
  end

  # Feel free to add other methods here, if you need them.
  
end


# Velvel = Contact.new("Velvel", "Shteynberg", "velvelshteynberg@velvel.com", "Great day")
# p Velvel

devorah = Contact.create("Devorah","shteynberg", "devorahshteynberg@devorah.com", "amazing day")
dev = Contact.create("Dev", "Shteyn", "devshteynbe@g.c", "hey")
p Contact.all
p "====================="
p Contact.find(1)
#not working
p "====================="
# p Contact.update(first_name)
#not working
p "====================="
# p Contact.find_by(@first_name, "Devorah")
#not working. Its return to me all the contacts in the array but I'm looking only for specific ones
p "====================="
# p Contact.delete_all
p "====================="
# velvel = Contact.new("Velvel", "SHteynberg", "velvels@s.s", "hey")
# print velvel.full_name
p "====================="
# p @@all_contacts.delete(1)
#not working. not sure why




