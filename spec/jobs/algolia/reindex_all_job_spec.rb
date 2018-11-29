# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Algolia Reindex All Job' do
  context 'when scheduling a reindex job' do
    it 'enqueues a new background job properly' do
      expect(Delayed::Job.all).to be_empty

      Algolia::ReindexAllJob.perform_async

      expect(Delayed::Job.count).to eq(1)
      delayed_job = Delayed::Job.first
      expect(delayed_job.handler).to include('ReindexAllJob')
    end
  end

  context 'when executing a reindex job' do
    it 'runs Algolia reindex operation on the expected models' do
      expect(Resource).to receive(:reindex)
      expect(Service).to receive(:reindex)
      Algolia::ReindexAllJob.new.perform
    end
  end
end
