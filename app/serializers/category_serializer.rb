# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :points
end
