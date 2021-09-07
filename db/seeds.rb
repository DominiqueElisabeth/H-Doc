10.times do |index|
        Patient.create!(
               	    name: "test",
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
               		date: DateTime.now.to_date
               	)
               end

               10.times do |index|
               	Post.create!(
               		title: Faker::Lorem.words,
               	    symptom: Faker::Lorem.sentence,
               	    remarks:  Faker::Lorem.sentence,
               	    
               	)
               end
