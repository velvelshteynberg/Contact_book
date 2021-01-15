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

  def main_menu
    p print_main_menu 
    user_selection = gets.chomp.to_i
    call_option(user_selection)
  end

  def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
     'Enter a number: '
  end

  

  def call_option(user_selection)
    if user_selection == "1"
    p add_new_contact
    elsif user_selection == "2"
    p  modify_existing_contact
    elsif user_selection == "3"
      delete_contact
    elsif user_selection == "4"
    p  display_all_contacts
    elsif user_selection == "5"
      search_by_attribute
    elsif user_selection == "6"
      abort "You have chosen to exit"
    end
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
  
    Contact.create(first_name, last_name, email, note)
  end

  
  def modify_existing_contact
    print "What value would you like to modify?"
    user_value_selection = gets.chomp
    print "What would you like to change the #{user_value_selection} tp?"
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
  end

  def delete_contact
    self.delete
  end

  def display_all_contacts
    @@all_contacts
  end

  def search_by_attribute
    
  end


end

velvel = CRM.new("Velvel", "Shteynberg", "Velvelshteynberg@vs.com", "Heeeeeyyyyyy")
devorah = CRM.new("Devorah", "Shteynberg", "Devorahshteynberg@ds.com", "Helllllooooooo")
avremel = CRM.new("Avremel", "Shteynberg", "Avremelshteynberg@as.com", "babbbbbyyyyyy")

p velvel.main_menu