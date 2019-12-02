FactoryBot.define do
  factory :subscriber do
    login{ Faker::App.name }
    password{ Faker::Internet.password(min_length: 8) }
  end
end
