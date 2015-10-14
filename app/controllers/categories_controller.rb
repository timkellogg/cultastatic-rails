class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all.order(created_at: :desc)
                          .paginate(page: params[:page], per_page: 10)
    @category = Category.new
  end

  def show
    @movies = @category.movies
  end


  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was successfully saved!"
      redirect_to categories_path
    else
      flash[:danger] = "Uh oh, something went wrong :("
      render :index
    end
  end

  def edit

  end


  def update
    if @category.update(category_params)
      flash[:success] = "Category change saved"
      redirect_to categories_path
    else
      flash[:danger] = "Nope, nothing has changed."
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Category gone forever!"
    else
      flash[:danger] = "Woops, it's still there . . ."
    end
    redirect_to categories_path
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
