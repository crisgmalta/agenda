class Client < ApplicationRecord
    has_many :contacts, dependent: :destroy
    validates :full_name, :email, :phone, presence: true
end
