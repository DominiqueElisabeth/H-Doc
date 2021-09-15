FactoryBot.define do
  factory :patient do
    name { "Patient 1" }
    email { "test@ex.com" }
    password { "123456" }
  end
  factory :patient2, class: Patient do
   name { "Patient 2" }
   email { "test2@ex.com" }
   password { "123456" }

 end
end
