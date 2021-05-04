FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/13418500155307.jpg'), filename: '13418500155307.jpg')
    end
    title                {'コカコーラ'}
    item_description     {'炭酸飲料です'}
    category_id          { 3 }
    condition_id         { 3 }
    delivery_id          { 3 }
    location_id          { 3 }
    item_date_id              { 3 }
    price                { 300 }
    
    association :user
  end
end
