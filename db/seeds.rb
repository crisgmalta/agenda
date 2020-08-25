10.times do |i|
    puts "criando Cliente #{i}"
  
    client = Client.create!(
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      created_at:  Faker::Date.in_date_period)
  
    3.times { client.contacts.create!(  full_name: Faker::Name.name,
                                        email: Faker::Internet.email,
                                        phone: Faker::PhoneNumber.cell_phone) }
  end
  
  puts "seed finalizado"
  