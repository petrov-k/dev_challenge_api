# frozen_string_literal: true

FactoryBot.define do
  factory :call do
    sequence(:name) { |number| "Call ##{number}" }
    location { 'Kharkiv' }
    emotional_tone { 'Positive' }
    text { 'Call text' }

    association :category
  end
end
