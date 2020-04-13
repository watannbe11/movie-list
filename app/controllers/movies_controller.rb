class MoviesController < ApplicationController

   def index
      if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
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
    params.require(:movie).permit(:title, :year, :photo)
  end
end
