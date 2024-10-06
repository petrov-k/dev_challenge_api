# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AudioProcessingService, :vcr do
  subject { described_class.call(audio_url) }

  let(:audio_url) { 'https://file-examples.com/storage/fe36b23e6a66fc0679c1f86/2017/11/file_example_MP3_700KB.mp3' }

  it 'creates a Call' do
    expect { subject }.to change { Call.count }.by(1)
  end
end
