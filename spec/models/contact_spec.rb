require 'rails_helper'

RSpec.describe Contact, type: :model do

    describe 'validations' do
      it { is_expected.to validate_presence_of(:full_name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:phone) }
    end
  end
  