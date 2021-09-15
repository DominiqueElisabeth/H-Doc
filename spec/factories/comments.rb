FactoryBot.define do
  factory :comment do
    content { "content" }
    post_id { 1 }
    association :doctor
  end
end
