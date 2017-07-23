class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    render json: params.slice(:challenge)
  end
end
