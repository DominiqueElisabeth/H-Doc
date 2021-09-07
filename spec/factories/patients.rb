FactoryBot.define do
  factory :patient do
    name { "patient-①" }
    email { "patient1@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :second_patient, class: Patient do
    name { "patient-②" }
    email { "patient2@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :third_patient, class: Patient do
    name { "patient-③" }
    email { "patient3@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
