FactoryBot.define do
  factory :appointment do

    date { "2021-09-07" }
    time { "2021-09-07 08:02:15" }
    post_id { 1 }
    association :doctor
  end
end
