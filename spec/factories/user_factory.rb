# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8, max_length: 8) }
  end

  before(:build) do |user|
    user.password_confirmation = user.password
  end
end
