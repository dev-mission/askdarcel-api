# frozen_string_literal: true

class ResourcesPresenter < Jsonite
  property :alternate_name
  property :certified
  property :email
  property :id
  property :legal_status
  property :long_description
  property :name
  property :short_description
  property :status
  property :verified_at
  property :website
  property :certified_at
  property(:services) do
    # Filter services in Ruby to avoid ignoring prefetched rows and generating
    # a new query.
    approved_services = services.select(&:approved?)
    ServicesPresenter.present(approved_services)
  end
  property :schedule, with: SchedulesPresenter
  property :phones, with: PhonesPresenter
  property :address, with: AddressPresenter
  property :notes, with: NotesPresenter
  property :categories, with: CategoryPresenter
  property :needs, with: NeedPresenter
  property :ratings, with: RatingPresenter
  # property :programs, with: ProgramsPresenter
end
