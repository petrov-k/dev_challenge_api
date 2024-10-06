# frozen_string_literal: true

class Call < ApplicationRecord
  has_one_attached :audio_file

  has_many :categories

  validates :audio_file, content_type: { in: ['audio/x-wav', 'audio/wav', 'audio/mp3', 'audio/mpeg'], message: 'Only WAV and MP3 files are allowed' }

  # emotial_tone is a string should be an enum
  # enum emotional_tone: { positive: 'Positive', negative: 'Negative', neutral: 'Neutral' }
end
