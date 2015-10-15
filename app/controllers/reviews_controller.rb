class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)

    if @review.save
      @movie.calculate_rating
      @movie.save
      flash[:success] = "Review was saved"
      redirect_to @movie
    else
      flash[:danger] = "Something went wrong :("
      redirect_to :back
    end
  end


  private

    def review_params
      params.require(:review).permit(:rating, :body, :movie_id)
    end

    def set_review
     @movie = Movie.find(params[:movie_id])
     @review = @movie.reviews.find(params[:id])
   end
end
