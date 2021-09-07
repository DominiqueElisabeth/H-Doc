FactoryBot.define do
  factory :health_interview do
    symptomatology { "症状" }
    condition { "持病" }
    comment { "" }
    # association :patient
  end
  factory :second_health_interview, class: HealthInterview do
    symptomatology { "" }
    condition { "" }
    comment { "コメント" }
    # association :patient, factory: :second_patient
  end
  factory :third_health_interview, class: HealthInterview do
    symptomatology { "" }
    condition { "" }
    comment { "コメント" }
    # association :patient, factory: :second_patient
  end
end
