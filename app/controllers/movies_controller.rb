class MoviesController < ApplicationController

   def index
    @movies =Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "new"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
