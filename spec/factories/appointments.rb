FactoryBot.define do
  factory :appointment do
    patient { nil }
    doctor { nil }
    doctor { "MyString" }
    patient { "MyString" }
    date { "2021-09-07" }
    time { "2021-09-07 08:02:15" }
  end
end
