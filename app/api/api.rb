# frozen_string_literal: true

require 'grape-swagger'

class Api < Grape::API
  format :json
  prefix :api

  mount Resources::Category
  mount Resources::Call

  add_swagger_documentation(
    schemes: ['http']
  )

  rescue_from ActiveRecord::RecordNotFound do
    error!({ error: 'Category not found' }, 404)
  end
end
