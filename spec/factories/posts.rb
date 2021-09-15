FactoryBot.define do
  factory :post do
    symptom { 'symptom' }
       comment { '' }
     end
     factory :second_post, class: 'post' do
       symptom { '' }
       remark { 'remark' }
     end
     factory :third_post, class: 'Post' do
       symptom { '' }
       remark { 'remark' }
    
     association :patient
   end
   end
