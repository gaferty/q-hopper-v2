class ReviewsController < ApplicationController
  def review
    @reviews = Review.all
  end
end
