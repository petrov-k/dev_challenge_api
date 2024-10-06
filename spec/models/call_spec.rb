# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Call, type: :model do
  context 'associations' do
    it { is_expected.to have_one_attached(:audio_file) }
    it { is_expected.to have_many(:categories) }
  end

  context 'validations' do
    it { is_expected.to validate_content_type_of(:audio_file).allowing(%w[audio/wav audio/mp3]) }
  end
end
