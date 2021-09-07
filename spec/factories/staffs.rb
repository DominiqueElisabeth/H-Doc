FactoryBot.define do
  factory :staff do
    name { "staff-①" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :second_staff, class: Staff do
    name { "staff-②" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :admin_staff, class: Staff do
    name { "staff-A" }
    password { "password" }
    password_confirmation { "password" }
    admin { true }
  end
end
