# frozen_string_literal: true

module Entities
  class Category < Grape::Entity
    expose :id, documentation: { type: 'Integer', desc: 'Unique identifier for the category' }
    expose :title, documentation: { type: 'String', desc: 'Category title' }
    expose :points, documentation: { type: 'Array[String]', desc: 'Category points' }
  end
end
