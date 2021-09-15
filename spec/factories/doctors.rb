FactoryBot.define do
  factory :doctor do
    name { "Doctor 1" }
    password { "123456" }
  end
  factory :doctor2, class: Doctor do
   name { "Doctor 2" }
   password { "123456" }

 end
 factory :admin, class: Doctor do
    name { "admin" }
    password { "123456" }
    admin { true }
  end
end
