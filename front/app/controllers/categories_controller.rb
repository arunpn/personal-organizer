class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @category = current_user.categories.build
    @categories = current_user.categories
  end
  
  def create
    @category = current_user.categories.build(params[:category])
    if @category.save
      flash[:notice] = "Category successfully created"
    else
      flash[:error] = "Can't create category"
    end
    redirect_to categories_path
  end
end