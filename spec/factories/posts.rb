FactoryBot.define do
  factory :post do
    symptom { 'symptom' }
    age { 1 }
    dob { "2021-09-07" }
    weight { 1 }
    phone { "MyString" }
    sex { "MyString" }
    remark { '' }
    association :patient
     end
     factory :post2, class: 'post' do
       symptom { '' }
       age { 1 }
       dob { "2021-09-07" }
       weight { 1 }
       phone { "MyString" }
       sex { "MyString" }
       remark { '' }
         association :patient
     end
     factory :post3, class: 'Post' do
       symptom { 'symptom' }
       age { 1 }
       dob { "2021-09-07" }
       weight { 1 }
       phone { "MyString" }
       sex { "MyString" }
       remark { 'remark' }
      association :patient
   end
   end
