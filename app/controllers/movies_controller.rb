class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create]
  before_action :logged_in_and_admin, only: [:destroy]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def show
    @reviews = @movie.reviews.order(created_at: :desc)
    @review = Review.new
    @category = @movie.category
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
    if @movie.update(movie_params)
      flash[:success] = "Edits saved"
      redirect_to @movie
    else
      flash[:danger] = "Edits saved"
      render 'edit'
    end
  end

  def destroy
    @category = @movie.category

    if @movie.destroy
      flash[:success] = "This movie is gone forever."
      redirect_to category_path(@category)
    else
      flash[:success] = "This movie still exists, try again."
      redirect_to category_path(@category)
    end
  end

  private

    def logged_in_and_admin
      unless current_user && current_user.admin?
        flash[:danger] = "Oh no you didnt"
        redirect_to root_url
      end
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :director, :release,
                                    :runtime, :summary, :picture,
                                    :actors, :category_id)
    end
end
