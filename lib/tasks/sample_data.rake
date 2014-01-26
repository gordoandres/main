namespace :db do
  desc "Llenar la base de datos con datos de ejemplo"
  task populate: :environment do
    admin = User.create!(name: "Mario Hernandez",
                 email: "mariohernandezv@yahoo.com.ar",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "ejemplo-#{n+1}@openii.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end