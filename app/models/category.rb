# frozen_string_literal: true

class Category < ApplicationRecord
  CONVERSATION_TOPICS = [
    'Visa and Passport Services',
    'Diplomatic Inquiries',
    'Travel Advisories',
    'Consular Assistance',
    'Trade and Economic Cooperation'
  ].freeze

  belongs_to :call, optional: true

  validates :title, presence: true
end
