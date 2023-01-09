# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    country_fr { Faker::Address.country }
    country_en { Faker::Address.country }
    iso_numerical { Faker::Address.building_number }
    iso_alpha2 { Faker::Address.country_code }
    iso_alpha3 { Faker::Address.country_code_long }
  end
end