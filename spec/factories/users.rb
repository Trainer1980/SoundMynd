FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    nickname { "MyString" }
    email { "MyString" }
    password { "" }
    admin { false }
  end
end
