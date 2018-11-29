# frozen_string_literal: true

module Algolia
  # Background job to reindex all relevant database records in Algolia.
  #
  # Usage:
  #
  # To send job to a background worker to execute:
  #
  # > Algolia::ReindexAllJob.perform_async
  #
  # To execute in-line immediately from Rails console:
  #
  # > Algolia::ReindexAllJob.new.perform
  #
  class ReindexAllJob
    def self.perform_async
      Delayed::Job.enqueue(Algolia::ReindexAllJob.new)
    end

    def perform
      Resource.reindex
      Service.reindex
    end
  end
end
