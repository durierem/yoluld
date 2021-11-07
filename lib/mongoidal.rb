# frozen_string_literal: true

require 'mongo'

# Basically a mini ODM for Mongo that wraps CRUD operations.
class Mongoidal
  @@client = Mongo::Client.new('mongodb://localhost:27017/yoluld')

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

  def initialize(attributes)
    attributes&.each do |attribute, value|
      instance_variable_set("@#{attribute}", value)
      self.class.define_method(attribute) do
        instance_variable_get("@#{attribute}")
      end
      self.class.define_method("#{attribute}=") do |argument|
        instance_variable_set("@#{attribute}", argument)
      end
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
