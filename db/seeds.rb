User.create!(username:  "Neil",
             email_address: "neil@admin.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  name,
               email_address: email,
               password:              password,
               password_confirmation: password)
end