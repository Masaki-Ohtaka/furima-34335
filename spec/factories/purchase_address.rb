FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    location_id   { 3 }
    municipality  { '東京都' }
    address       { '1-1' }
    building_name { '建物ハウス' }
    phone_number  { '0804034333'}
    token         { 'aiueokakikukeko'}  
  end
end
