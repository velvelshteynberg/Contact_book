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
    when 6 then abort "You have chosen to exit"
    end
  end

  def main_menu
    while true
    print_main_menu 
    user_selection = gets.chomp.to_i
    call_option(user_selection)
    end
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
  
    contact = Contact.create(
  first_name: first_name,
  last_name:  last_name,
  email:      email,
  note:       note
)
  
end

  
  def modify_existing_contact
    puts "what is the id value of the contact that you would like to update?"
    id = gets.chomp.to_i
    contact_wanting_to_modify = Contact.find(id)
    puts "What value would you like to modify in #{contact_wanting_to_modify.inspect}(first_name, last_name, email, note)?"
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
   'Enter a number: '
    user_value_selection = gets.chomp.to_i
    case user_value_selection
    when 1 then key_value = "first_name"
    when 2 then key_value = "last_name"
    when 3 then key_value = "email"
    when 4 then key_value = "note"
    end
    puts "What would you like to change the #{key_value} to?"
    changed_value = gets.chomp
    contact_wanting_to_modify.update(key_value => changed_value)
  end

  def delete_contact
    puts "what is the id value of the contact that you would like to update? If you want to delete all contacts please press 0"
    id = gets.chomp.to_i
    contact_wanting_to_modify = Contact.find(id)
    if id == 0
      Contact.delete_all
      p "You have deleted all contacts"
    else
      print "you have deleted #{contact_wanting_to_modify.delete}"
    end 
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    p "What attribute are you looking for? (first_name, last_name, email, note)?"
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
   'Enter a number: '
    selected_attribute = gets.chomp.to_i 
    case selected_attribute
    when 1 then key_value = "first_name"
    when 2 then key_value = "last_name"
    when 3 then key_value = "email"
    when 4 then key_value = "note"
    end
    p "What is the corresponding value to this attribute? (e.g. what is the guys first name?)"
    its_value = gets.chomp 
    puts "The contact that you are looking for is #{Contact.find_by(key_value => its_value).inspect}"
  end 
  

  

end 

at_exit do
  ActiveRecord::Base.connection.close
end


a_crm_app = CRM.new
a_crm_app.main_menu
