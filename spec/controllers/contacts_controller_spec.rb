require 'rails_helper'

describe ContactsController, type: :controller do
    
    before do
        sign_in(user)
    end
    
    describe "anonymous user" do
        # This simulates an anonymous user
        let(:user) { User.new }
    end
    
    describe "with a valid user" do
        let(:user) { User.create(email: "test@example.com", password: "123456Ab") };
        let(:client) { Client.create!(full_name: "Name",  email: "email@email.com", phone: "11-987654321") }
        
        let(:valid_attributes) do
            {   client_id: client.id,
                full_name: "name test",
                email: "email@gmail.com",
                phone: "11-96565432"
            }
        end
        
        let(:invalid_attributes) do
            {
                full_name: nil,
                email: "email@gmail.com",
                phone: '11-94343558'
            }
        end
        
        let(:valid_session) { {} }
        
        describe "GET #index" do
            it "returns a success response" do
                Contact.create! valid_attributes
                get :index, params: {client_id: client.id}, session: valid_session
                expect(response).to be_successful
            end
        end
        describe "GET #show" do
            it "returns a success response" do
                contact = Contact.create! valid_attributes
                get :show, params: {client_id: client.id, id: contact.to_param}, session: valid_session
                expect(response).to be_successful
            end
        end
        
        
        describe "GET #new" do
            it "returns a success response" do
                get :new, params: valid_attributes, session: valid_session
                expect(response).to be_successful
            end
        end
        
        describe "GET #edit" do
            it "returns a success response" do
                contact = Contact.create! valid_attributes
                get :edit, params: {client_id: client.id, id: contact.to_param}, session: valid_session
                expect(response).to be_successful
            end
        end
        
        describe "POST #create" do
            context "with valid params" do
                it "creates a new Contact" do
                    expect {
                        post :create, params: {client_id: client.id, contact: valid_attributes}, session: valid_session
                    }.to change { Contact.count }.by(1)
                end
            end
            
            context "with invalid params" do
                it "returns a alert" do
                    post :create, params: {client_id: client.id, contact: invalid_attributes}, session: valid_session
                    expect(response.body).to match("Full name can&#39;t be blank")
                end
            end
        end
        
        describe "PUT #update" do
            context "with valid params" do
                let(:new_attributes) { valid_attributes.merge(email: "new_email@email.com") }
                
                it "updates the requested contact" do
                    contact = Contact.create! valid_attributes
                    put :update, params: {client_id: client.id, id: contact.to_param, contact: new_attributes}, session: valid_session
                    contact.reload
                    expect(contact.email).to eq "new_email@email.com"
                end
                
                it "redirects to the client" do
                    contact = Contact.create! valid_attributes
                    put :update, params: {client_id: client.id, id: contact.to_param, contact: valid_attributes}, session: valid_session
                    expect(response).to redirect_to(client_contacts_path)
                end
            end
            
            
            context "with invalid params" do
                it "returns a success response " do
                    contact = Contact.create! valid_attributes
                    put :update, params: {client_id: client.id, id: contact, contact: invalid_attributes}, session: valid_session
                    expect(response).to be_successful
                end
            end
        end
        
        describe "DELETE #destroy" do
            it "destroys the requested contact" do
                contact = Contact.create! valid_attributes
                expect {
                    delete :destroy, params: {client_id: client.id, id: contact.to_param}, session: valid_session
                }.to change(Contact, :count).by(-1)
            end
            
            it "redirects to the contact list" do
                contact = Contact.create! valid_attributes
                delete :destroy, params: {client_id: client.id, id: contact.to_param}, session: valid_session
                expect(response).to redirect_to(client_contacts_path)
            end
        end
        
    end
    
end
