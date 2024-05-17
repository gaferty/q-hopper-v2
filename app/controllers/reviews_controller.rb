class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!
  def review
    @reviews = Review.all
  end

  def new
    @reviews = Review.new
  end

  def create
    @reviews = Review.create
  end

end
