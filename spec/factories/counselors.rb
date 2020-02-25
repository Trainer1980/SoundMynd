FactoryBot.define do
  factory :counselor do
    first_name { "MyString" }
    last_name { "MyString" }
    specialty { "MyString" }
    desc { "MyText" }
    email { "MyString" }
    user { nil }
  end
end
