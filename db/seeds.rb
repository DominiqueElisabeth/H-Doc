10.times do |index|
        Patient.create!(
               	    name: "sample",
               	    email: "test@gmail.com",
               	    password: "password",
               	    password_confirmation: "password",
               	)
               end
10.times do |index|
        Doctor.create!(
               	    name: "name",
               	    email: "email",
               	    password: "password",
               	    admin: false,
               	)
               end
               Doctor.create!(
                   name: "admin",
                   password: "password",
                   admin: true,
               )


10.times do |index|
        Appointment.create!(
              date: DateTime.now.to_date,
              time: Time.now,
               	)
               end

10.times do |index|
        Post.create!(
              title: Faker::Lorem.words,
              symptom: Faker::Lorem.sentence,
              remarks:  Faker::Lorem.sentence,
              date: DateTime.now.to_date,
               	)
               end

10.times do |index|
         Comment.create!(
               comment_id: Comment.all.pluck(:id).sample,
               doctor_id: Doctor.all.pluck(:id).sample,
               content:  Faker::Lorem.sentence,
               	)
               end
