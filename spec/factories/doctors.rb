FactoryBot.define do
  factory :doctor do
    name { "doctor" }
    password { "123456" }
    password_confirmation { "123456" }
  end
  factory :doctor2, class: Doctor do
   name { "doctor2" }
   password { "123456" }
   password_confirmation { "123456" }

 end
 factory :admin_doctor, class: Doctor do
    name { "admin" }
    password { "123456" }
    password_confirmation { "123456" }
    admin { true }
  end
end
