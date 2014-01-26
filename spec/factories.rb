FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Persona #{n}" }
    sequence(:email) { |n| "persona_#{n}@ejemplo.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
    	admin true
    end
  end
end