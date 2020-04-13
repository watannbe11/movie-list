class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
  if @review.save
    redirect_to movie_path(@movie)
  else
    redirect_to root_path
  end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
  end

  def update
    @review.update(review_params)
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
