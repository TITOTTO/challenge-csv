# frozen_string_literal: true

FactoryBot.define do
  factory :embassy do
    association :country
    building { Faker::Address.country }
    latitude { Faker::Address.building_number }
    longitude { Faker::Address.building_number }
    contact { Faker::Address.building_number }
  end
end