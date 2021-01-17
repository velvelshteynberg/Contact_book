class CRM

     @@all_contacts = []
     @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@all_contacts << self
    @@id += 1
  end

  attr_accessor :first_name 
  attr_accessor :last_name 
  attr_accessor :email 
  attr_accessor :note
  attr_accessor :all_contacts

   def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
     'Enter a number: '
    end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
  
    print 'Enter Last Name: '
    last_name = gets.chomp
  
    print 'Enter Email Address: '
    email = gets.chomp
  
    print 'Enter a Note: '
    note = gets.chomp
  
    new_contact = CRM.new(first_name, last_name, email, note)
    @@all_contacts << new_contact
    return new_contact
  end

  
  def modify_existing_contact
    print "What value would you like to modify(first_name, last_name, email, note)?"
    user_value_selection = gets.chomp
    print "What would you like to change the #{user_value_selection} to?"
    changed_value = gets.chomp
    if user_value_selection == "first_name"
      @first_name = changed_value
    elsif user_value_selection == "last_name"
      @last_name = changed_value
    elsif user_value_selection == "email"
      @email = changed_value
    elsif user_value_selection == "note"
      @note = changed_value
    end 
    return self 
  end

  def delete_contact
    @@all_contacts.delete(self)
    p "you deleted #{self}"
    "your remaining contacts are #{@@all_contacts}"
  end

  def display_all_contacts
    @@all_contacts
  end

  def search_by_attribute
    p "What attribute are you looking for? (first_name, last_name, email, note)?"
    selected_attribute = gets.chomp 
    p "What is the corresponding value to this attribute? (e.g. what is the guys first name?)"
    its_value = gets.chomp
    @@all_contacts.each do |individual_contact|
      if @selected_attribute == its_value
        return individual_contact
      end  
      #I dont really know why this is returning all of the value in the array
    end 
  end 
  

  def call_option(user_selection)
    case user_selection
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then "You have chosen to exit"
    end
  end

  def main_menu
    p print_main_menu 
    user_selection = gets.chomp.to_i
    call_option(user_selection)
  end

end 


velvel = CRM.new("Velvel", "Shteynberg", "Velvelshteynberg@vs.com", "Heeeeeyyyyyy")
devorah = CRM.new("Devorah", "Shteynberg", "Devorahshteynberg@ds.com", "Helllllooooooo")
avremel = CRM.new("Avremel", "Shteynberg", "Avremelshteynberg@as.com", "babbbbbyyyyyy")

p devorah.main_menu
