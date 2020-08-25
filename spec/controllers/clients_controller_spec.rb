require 'rails_helper'

describe ClientsController, type: :controller do
    
    before do
        sign_in(user)
    end
    
    describe "anonymous user" do
        # This simulates an anonymous user
        let(:user) { User.new }
        
        it "should be redirected to signin" do
            get :index
            expect(response).to redirect_to new_user_session_path
        end
    end
    
    describe "with a valid user" do
        let(:user) { User.create(email: "test@example.com", password: "123456Ab") }
        
        let(:valid_attributes) do
            {
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
                Client.create! valid_attributes
                get :index, params: {}, session: valid_session
                expect(response).to be_successful
            end
        end
        
        describe "GET #show" do
            it "returns a success response" do
                client = Client.create! valid_attributes
                get :show, params: {id: client.to_param}, session: valid_session
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
                client = Client.create! valid_attributes
                get :edit, params: {id: client.to_param}, session: valid_session
                expect(response).to be_successful
            end
        end
        
        describe "POST #create" do
            context "with valid params" do
                it "creates a new Client" do
                    expect {
                        post :create, params: {client: valid_attributes}, session: valid_session
                    }.to change { Client.count }.by(1)
                end
            end
            
            context "with invalid params" do
                it "returns a alert" do
                    post :create, params: {client: invalid_attributes}, session: valid_session
                    expect(response.body).to match("Full name can&#39;t be blank")
                end
            end
        end
        
        
        
        describe "PUT #update" do
            context "with valid params" do
                let(:new_attributes) { valid_attributes.merge(full_name: "new name") }
                
                it "updates the requested client" do
                    client = Client.create! valid_attributes
                    put :update, params: {id: client.to_param, client: new_attributes}, session: valid_session
                    client.reload
                    expect(client.full_name).to eq "new name"
                end
                
                it "redirects to the client" do
                    client = Client.create! valid_attributes
                    put :update, params: {id: client.to_param, client: valid_attributes}, session: valid_session
                    expect(response).to redirect_to(clients_path)
                end
            end
            
            
            context "with invalid params" do
                it "returns a success response (i.e. to display the 'edit' template)" do
                    client = Client.create! valid_attributes
                    put :update, params: {id: client.to_param, client: invalid_attributes}, session: valid_session
                    expect(response).to be_successful
                end
            end
        end
        
        
        
        
        describe "DELETE #destroy" do
            it "destroys the requested client" do
                client = Client.create! valid_attributes
                expect {
                    delete :destroy, params: {id: client.to_param}, session: valid_session
                }.to change(Client, :count).by(-1)
            end
            
            it "redirects to the client list" do
                client = Client.create! valid_attributes
                delete :destroy, params: {id: client.to_param}, session: valid_session
                expect(response).to redirect_to(clients_url)
            end
        end
        
    end   
    
end


