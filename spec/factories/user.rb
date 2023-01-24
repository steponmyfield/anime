FactoryBot.define do
  factory :user do
    username { "test" }
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end
end
