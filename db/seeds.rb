Patient.create!(name: "sample",
                email: "sample@mail.com",
                password: "password"
                # confirmed_at: Time.now
               )

10.times do |n|
  name = Gimei.name.katakana
  email = Faker::Internet.email
  password = "password"

  Patient.create!(name: name,
                  email: email,
                  password: password
                  # confirmed_at: Time.now
                 )
end

5.times do |n|
  name = Gimei.name.katakana
  password = "password"

  Staff.create!(name: name,
                password: password
               )
end

Staff.create!(name: "admin_staff",
              password: "password",
              admin: true
             )

Staff.create!(name: "staff",
              password: "password",
              admin: false
             )

10.times do |n|
  HealthInterview.create!(symptomatology: "症状詳細",
                          condition: "持病、服用中の薬等",
                          patient_id: "#{n + 1}"
                          )
end

2.times do |n|
  HealthInterview.create!(comment: "コメント#{n + 1}",
                           patient_id: 1
                          )
end

HealthInterview.eager_load(:guide_status).all.each do |hi|
  GuideStatus.create!(health_interview_id: hi.id,
                      # Staff_id: 1
                     )
end