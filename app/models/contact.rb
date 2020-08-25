class Contact < ApplicationRecord
  belongs_to :client, optional: true
  validates :full_name, :email, :phone, presence: true
end
