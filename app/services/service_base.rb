# frozen_string_literal: true

module ServiceBase
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def call(...)
      new(...).call
    end
  end

  def call
    raise NotImplementedError, "class #{self.class.name} must implement abstract method 'call()'"
  end
end
