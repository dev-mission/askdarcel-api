class NeedsController < ApplicationController
  # returns just the top-level Needs
  def index
    @needs = Need.roots
    render json: NeedPresenter.present(@needs)
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
