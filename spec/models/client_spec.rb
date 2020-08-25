require 'rails_helper'

RSpec.describe Client, type: :model do

    describe 'validations' do
      it { is_expected.to validate_presence_of(:full_name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:phone) }
    end
 
      it 'should save successfully' do
        client = Client.new( full_name:'John Lewis',email:'john@gmail.com', phone:'11977667636').save
        expect(client).to eq(true)  
      end
        
      describe "associations" do
        it{ is_expected.to have_many(:contacts) }
      end 

end            