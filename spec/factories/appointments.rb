FactoryBot.define do
  factory :appointment do
    doctor { "MyString" }
    patient { "MyString" }
    date { "2021-09-07" }
    time { "2021-09-07 08:02:15" }
    association :patient
    association :doctor
  end
end
