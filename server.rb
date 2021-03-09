require 'sinatra'
require_relative './contact.rb'

all_contacts = [{first_name: 'Velvel', last_name: 'Shteynberg', email: "VS@vs.com", note: "hi", id: "0"}]

get '/' do
    redirect to('/developer')
end 

get '/developer' do
    "<h1> The developers name is Velvel Shteynberg </h1>"
end 

get '/display-contacts' do
    @all_contacts = all_contacts
    erb :display_contacts
end 

#not working. IDK why
get '/Delete_contact' do
    id = params[:id]
    deleting_contact = all_contacts.find(id)
    deleting_contact.delete[:first_name]
    deleting_contact.delete[:last_name]
    deleting_contact.delete[:email]
    deleting_contact.delete[:note]
    "<h1> You have deleted #{deleting_contact}"
end 

get '/Modify_contact' do 
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @note = params[:note]
    @id = params[:id]
    erb :modify_contact
end 

post '/New_contact' do
    new_contact = {}
    new_contact[:first_name] = params[:first_name]
    new_contact[:last_name]  = params[:last_name]
    new_contact[:email] = params[:email]
    new_contact[:note]  = params[:note]
    new_contact[:id]  = params[:id]
    all_contacts << new_contact
    redirect to('display-contacts')
end 

get '/Create_new_contact' do
    erb :create_new_contact
end 