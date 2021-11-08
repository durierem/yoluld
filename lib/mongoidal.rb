# frozen_string_literal: true

require 'mongo'

# Basically a mini ODM for Mongo that wraps up CRUD operations.
class Mongoidal
  @@client = Mongo::Client.new(ENV['MONGO_CONNSTRING'])

  def self.collection
    @@client[to_s]
  end

  def self.create(attributes)
    new(attributes).save
  end

  def self.find_by(query)
    document = collection.find(query).first
    document.nil? ? nil : new(document)
  end

  def self.find_or_create_by(query)
    document = collection.find(query).first
    return new(document) unless document.nil?

    new_document = new(query)
    new_document.save ? new_document : nil
  end

  attr_reader :_id

  def initialize(attributes)
    attributes&.each do |attribute, value|
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
    instance_variables.map do |var|
      [var.to_s.delete_prefix('@'), instance_variable_get(var)]
    end.to_h
  end

  def collection
    self.class.collection
  end
end
