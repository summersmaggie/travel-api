class ReviewsController < ApplicationController

  def index
    destination = params[:destination]
    author = params[:author]

    if destination
      @reviews = Review.search_destination(destination)
      json_response(@reviews)
    elsif
      @author = Review.search_author(author)
      json_response(@author)
    else
      Review.search_most_popular
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    @review.update!(review_params)
      render status: 200, json: {
        message: "Your quote has been updated successfully."
        }
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render status: 200, json: {
      message: "Your quote has been deleted successfully."
      }
  end

  private
  def review_params
    params.permit(:author, :content, :destination)
  end
end
