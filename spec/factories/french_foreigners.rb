# frozen_string_literal: true

FactoryBot.define do
  factory :french_foreigner do
    association :country
    year { Faker::Address.building_number }
    nbr_fr { Faker::Address.building_number }
  end
end