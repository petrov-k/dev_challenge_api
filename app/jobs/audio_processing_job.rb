# frozen_string_literal: true

class AudioProcessingJob < ApplicationJob
  queue_as :default

  def perform(audio_url)
    AudioProcessingService.call(audio_url)
  end
end
