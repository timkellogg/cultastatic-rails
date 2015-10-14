class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def show
    @reviews = @movie.reviews.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @movie = Movie.new
  end

  def create
    @category = Category.find(params[:category_id])
    @movie = @category.movies.new(movie_params)

    if @movie.save
      # @category.save
      flash[:success] = "Legit! Just added a movie!"
      redirect_to @movie
    else
      flash[:danger] = "Say what? No way, it didn't work!"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :director, :release,
                                    :runtime, :summary, :picture,
                                    :actors, :category_id)
    end
end
