FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa123"}
    password_confirmation {password}
    first_name             {"あああ"}
    last_name              {"あああ"}
    first_name_kana        {"アアア"}
    last_name_kana         {"アアア"}
    birth                  {Faker::Date.backward}
  end
end