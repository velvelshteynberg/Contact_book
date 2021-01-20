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
      @@id += 1
  end
  attr_accessor :id, :first_name, :email, :note, :last_name

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@all_contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@all_contacts
  end
  #not working: returning my list 2x

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@all_contacts.each do |individual_contact|
      if individual_contact.id == id
        return individual_contact
      end 
    end
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
 
  def update(attribute, new_value_for_attribute)
    if attribute == "first_name" 
      @first_name = new_value_for_attribute
    elsif attribute == "last_name"
      @last_name = new_value_for_attribute
    elsif attribute == "email"
      @email = new_value_for_attribute
    elsif attribute == "note"
      @note = new_value_for_attribute
    end 
    return self 
  end 

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@all_contacts.each do |individual_contact|
    if attribute == "first_name" && value == individual_contact.first_name
      return individual_contact
    elsif attribute == "last_name" && value == individual_contact.last_name
      return individual_contact
    elsif attribute == "email" && value == individual_contact.email
      return individual_contact
    elsif attribute == "id" && value == individual_contact.id
      return individual_contact
    elsif attribute == "note" && value == individual_contact.note
    end 
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@all_contacts.clear
    @@all_contacts
  end

  def full_name
  "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact form the array of contacts
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@all_contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.
  
end


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





