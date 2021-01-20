require_relative 'contact'
class CRM

  def initialize
    
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
  
    new_contact = Contact.create(first_name, last_name, email, note)
  end

  
  def modify_existing_contact
    puts "what is the id value of the contact that you would like to update?"
    id = gets.chomp.to_i
    p Contact.find(id)
    print "What value would you like to modify in #{Contact.find(id)}(first_name, last_name, email, note)?"
    user_value_selection = gets.chomp
    print "What would you like to change the #{user_value_selection} to?"
    changed_value = gets.chomp
    Contact.update(user_value_selection, changed_value) 
  end

  def delete_contact
    puts "what is the id value of the contact that you would like to update? If you want to delete all contacts please press 0"
    id = gets.chomp.to_i
    puts "The contact that you have deleted is #{Contact.delete}"
    if id == 0
      Contact.delete_all
      p "You have deleted all contacts"
    end 
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    p "What attribute are you looking for? (first_name, last_name, email, note)?"
    selected_attribute = gets.chomp 
    p "What is the corresponding value to this attribute? (e.g. what is the guys first name?)"
    its_value = gets.chomp 
    p "THe contact that you are looking for is #{Contact.find_by(attribute, value)}"
  end 
  

  

end 


a_crm_app = CRM.new
a_crm_app.main_menu
