FactoryBot.define do
  factory :post do
    symptom { 'symptom' }
    age { 1 }
    dob { "2021-09-07" }
    weight { 1 }
    phone { "MyString" }
    sex { "MyString" }
    remark { "MyText" }
    remark { '' }
     end
     factory :second_post, class: 'post' do
       symptom { '' }
       age { 1 }
       dob { "2021-09-07" }
       weight { 1 }
       phone { "MyString" }
       sex { "MyString" }
       remark { '' }
     end
     factory :third_post, class: 'Post' do
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
