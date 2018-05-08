class ReviewsController < ApplicationController

  def index
    @reviews = {"review": "The secret of getting ahead is getting started."}
    json_response(@reviews)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end
end
