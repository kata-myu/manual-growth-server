class CategoriesController < ApplicationController
  def index
    categories = Category.all
    manuals = Manual.all.order('created_at desc')
    datas = [categories, manuals]
    
    render json: datas
  end
end
