# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:title) { |number| "Category ##{number}" }
    points { ['first point', 'second point'] }

    association :call
  end
end
