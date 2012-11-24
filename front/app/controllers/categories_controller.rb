class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @categories = current_user.categories.select(&:valid?)
    @category = current_user.categories.build
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
  
  def update
    @category = Category.find_by_user!(params[:id], current_user)
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category successfully updated"
    else
      flash[:error] = "Can't update category"
    end
    redirect_to categories_path
  end
  
  def destroy
    @category = Category.find_by_user!(params[:id], current_user)
    if @category.destroy
      flash[:notice] = "Category successfully deleted"
    else
      flash[:error] = "Can't delete category"
    end
    redirect_to categories_path
  end
end