FactoryBot.define do
  factory :support_group do
    name { "MyString" }
    desc { "MyText" }
    date { "2020-02-24" }
    time { "2020-02-24 16:40:12" }
    user { nil }
  end
end
