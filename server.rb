require 'sinatra'
require_relative './contact.rb'

get '/' do
    redirect to('/developer')
end 

get '/developer' do
    "<h1> The developers name is Velvel Shteynberg </h1>"
end 

get '/display-contacts' do
   @all_contacts = Contact.all
    erb :display_contacts
end 

get '/Delete_contact' do
    @contact_looking_to_delete = Contact.find(params[:id])
    erb :delete_contact
    redirect to('/display-contacts')
end 

get '/Modify_contact' do 
    @contact_looking_to_modify = Contact.find(params[:id])
    erb :modify_contact
    # all_contacts << Contact_wanting_to_modify
    # redirect to('/display-contacts')
end 

post '/update_contact/:id' do
    contact_wanting_to_modify = Contact.find(params[:id])
    p params
    contact_wanting_to_modify.first_name = params[:first_name]
    contact_wanting_to_modify.last_name = params[:last_name]
    contact_wanting_to_modify.email = params[:email]
    contact_wanting_to_modify.note = params[:note]
    contact_wanting_to_modify.save
    # new_contact = {}
    # new_contact[:first_name] = params[:first_name]
    # new_contact[:last_name]  = params[:last_name]
    # new_contact[:email] = params[:email]
    # new_contact[:note]  = params[:note]
    # new_contact[:id]  = params[:id]
    # new_contact = Contact.create[first_name: params["first_name"], last_name: params["last_name"], email: params["email"], note: params[:"note"], id: params[:"id"]]
    # all_contacts << new_contact
    redirect to('display-contacts')
end 

get '/New_contact_form' do
    erb :create_new_contact
end 

post '/create_new_contact' do
    new_contact = Contact.new(first_name: params["first_name"], last_name:  params["last_name"], email: params["email"], note: params["note"])
    new_contact.save
    # new_contact = Contact.create
    # new_contact.first_name = params[:first_name]
    # new_contact.last_name = params[:last_name]
    # new_contact.email = params[:email]
    # new_contact.note = params[:note]
    # new_contact.save

    redirect to('/display-contacts')
end 