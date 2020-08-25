json.extract! contact, :id, :client_id, :full_name, :email, :phone, :client_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
