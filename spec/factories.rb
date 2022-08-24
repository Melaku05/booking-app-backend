FactoryBot.define do
  factory Doctor do
    name { Faker::Name.name }
    detail { Faker::Lorem.paragraph }
    photo { Faker::Lorem.sentence }
    city { Faker::Lorem.sentence }
    specialization { Faker::Lorem.sentence }
    fee { Faker::Number.decimal(2) }
  end

  factory Reservation do
    city { 'Imphal' }
    date { '24/08/2022' }
    user_id { 1 }
    doctor_id { 1 }
  end
end
