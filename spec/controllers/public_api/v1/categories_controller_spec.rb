# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::PublicApi::V1::CategoriesController do
  let!(:category) { create(:category) }

  describe 'GET #index' do
    let!(:categories) { create_list(:category, 3, call: call) }
    let(:call) { create(:call) }

    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(Category.count)
      json_response.each do |category|
        expect(category.keys).to contain_exactly('id', 'title', 'points')
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:category_params) do
        { title: 'Test title', points: %w[first second] }
      end

      it 'creates a new Category' do
        expect do
          post :create, params: { category: category_params }
        end.to change(Category, :count).by(1)
      end

      it 'renders a JSON response with the new category' do
        post :create, params: { category: category_params }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')

        json_response = JSON.parse(response.body)
        expect(json_response.keys).to contain_exactly('id', 'title', 'points')
        expect(json_response['title']).to eq('Test title')
        expect(json_response['points']).to eq(%w[first second])
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new category' do
        post :create, params: { category: { title: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:update_params) { { title: 'Updated title' } }

      it 'updates the requested category' do
        expect { put :update, params: { id: category.id, category: update_params } }
          .to change { category.reload.title }.to('Updated title')
      end

      it 'renders a JSON response with the category' do
        put :update, params: { id: category.id, category: update_params }

        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)
        expect(json_response.keys).to contain_exactly('id', 'title', 'points')
        expect(json_response['title']).to eq('Updated title')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end
  end
end
