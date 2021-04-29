FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation {password}
    last_name             { "太郎" }
    first_name            {"嵐山"}
    last_kana             {"タロウ"}
    first_kana            {"アラシヤマ"}
    birthday              {"19301010"}
  end
end
