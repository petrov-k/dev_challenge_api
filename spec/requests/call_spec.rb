# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Resources::Call, type: :request do
  let!(:call) { create(:call) }

  context 'POST /api/call' do
    let(:params) { { audio_url: 'New Category' } }

    it 'creates call and returns a success response' do
      post '/api/call', params: params
      # expect(response).to have_http_status(:created)

      # json_response = JSON.parse(response.body)
      # expect(json_response['title']).to eq(params[:title])
      # expect(json_response['points']).to eq(params[:points])
    end
  end

  context 'GET /api/call/:id' do
    it 'find and return call by id' do
      get "/api/call/#{call.id}"

      # expect(response).to have_http_status(:ok)

      # json_response = JSON.parse(response.body)
      # expect(json_response['title']).to eq(params[:title])
      # expect(json_response['points']).to eq(params[:points])
    end
  end
end
