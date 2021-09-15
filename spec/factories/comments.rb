FactoryBot.define do
  factory :comment do
    content { "content" }
    association :post
  end
end
