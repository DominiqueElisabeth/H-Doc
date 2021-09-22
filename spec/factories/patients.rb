FactoryBot.define do
  factory :patient do
    name { "Patient1" }
    email { "test@ex.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :patient2, class: Patient do
   name { "Patient2" }
   email { "test2@ex.com" }
   password { "123456" }
   password_confirmation { "123456" }

 end
 factory :patient3, class: Patient do
  name { "Patient3" }
  email { "test3@ex.com" }
  password { "123456" }
  password_confirmation { "123456" }
end
end
