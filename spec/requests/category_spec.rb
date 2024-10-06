# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Resources::Category, type: :request do
  let!(:category) { create(:category) }

  context 'GET /api/category' do
    let!(:categories) { create_list(:category, 2) }

    it 'returns a success response' do
      get '/api/category'
      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(Category.count)
      json_response.each do |category|
        expect(category.keys).to contain_exactly('id', 'title', 'points')
      end
    end
  end

  context 'POST /api/category' do
    let(:params) { { title: 'New Category', points: %w[point1 point2] } }

    it 'creates category and returns a success response' do
      post '/api/category', params: params
      expect(response).to have_http_status(:created)

      json_response = JSON.parse(response.body)
      expect(json_response['title']).to eq(params[:title])
      expect(json_response['points']).to eq(params[:points])
    end
  end

  context 'PUT /api/category/:id' do
    let(:params) { { title: 'Updated Category', points: %w[point1 point2] } }

    it 'updates category and returns a success response' do
      put "/api/category/#{category.id}", params: params
      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response['title']).to eq(params[:title])
      expect(json_response['points']).to eq(params[:points])
    end
  end

  context 'DELETE /api/category/:id' do
    it 'deletes category and returns a success response' do
      delete "/api/category/#{category.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
