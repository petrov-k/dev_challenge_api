# frozen_string_literal: true

module Entities
  class Call < Grape::Entity
    expose :id, documentation: { type: 'Integer', desc: 'Unique identifier for the call' }
    expose :name, documentation: { type: 'String', desc: 'Category title' }
    expose :location, documentation: { type: 'String', desc: 'Location' }
    expose :emotional_tone, documentation: { type: 'String', desc: 'Emotional tone of the call' }
    expose :text, documentation: { type: 'String', desc: 'Transcribed text' }
    # possible expose with different entity
    expose :categories, documentation: { type: 'Array[String]', desc: 'Categories topics of the call' }
    # {
    #   "id": "call_id",
    #   "name": "Call Name",
    #   "location": "Kyiv",
    #   "emotional_tone": "Neutral",
    #   "text": "Transcribed text",
    #   "categories": ["Topic Title 1","Topic Title 2"]
    # }
  end
end
