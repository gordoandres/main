namespace :db do
  desc "Llenar la base de datos con datos de ejemplo"
  task populate: :environment do
    User.create!(name: "Usuario ejemplo",
                 email: "ejemplo@openii.com",
                 password: "password",
                 password_confirmation: "password")
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