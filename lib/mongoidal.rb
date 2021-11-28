# frozen_string_literal: true

require 'mongo'

# Basically a mini ODM for Mongo that wraps up CRUD operations.
class Mongoidal
  class << self
    def collection
      @client ||= Mongo::Client.new(ENV['MONGO_URI'])
      @client[to_s]
    end

    def create(attributes = {})
      new(attributes).save
    end

    def find_by(query)
      document = collection.find(query).first
      document.nil? ? nil : new(document)
    end

    def find_or_create_by(query)
      document = collection.find(query).first
      return new(document) unless document.nil?

      new_document = new(query)
      new_document.save ? new_document : nil
    end
  end

  attr_reader :_id

  def initialize(attributes = {})
    attributes.each do |attribute, value|
      instance_variable_set("@#{attribute}", value)
    end
  end

  def save
    if @_id.nil?
      result = collection.insert_one(to_h)
      @_id = result.inserted_id if result.successful?
      return result.successful?
    end

    collection.update_one({ _id: @_id }, to_h).successful?
  end

  def to_h
    ary = instance_variables.map do |var|
      [var.to_s.delete_prefix('@'), instance_variable_get(var)]
    end
    ary.to_h
  end

  def collection
    self.class.collection
  end
end
