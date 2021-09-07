FactoryBot.define do
  factory :post do
    symptom { "MyText" }
    age { 1 }
    dob { "2021-09-07" }
    weight { 1 }
    phone { "MyString" }
    sex { "MyString" }
    remark { "MyText" }
    patient { nil }
  end
end
