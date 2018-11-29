# frozen_string_literal: true

module Algolia
  # Job to reindex a specific record in Algolia. Useful for syncing changes to
  # Algolia after a record has been updated in the database.
  class ReindexJob
    attr_accessor :model_class, :id

    def initialize(model_class, id)
      @model_class = model_class
      @id = id
    end

    def self.perform_async(model_class, id)
      Delayed::Job.enqueue(Algolia::ReindexJob.new(model_class, id))
    end

    def perform
      record = model_class.find_by(id: id)
      record.index! if record.present?
    end
  end
end
