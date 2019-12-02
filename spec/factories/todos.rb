# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title{ 'Build an actual application from this template :)' }
    created_by{ Faker::Number.number(digits: 10) }
  end
end
