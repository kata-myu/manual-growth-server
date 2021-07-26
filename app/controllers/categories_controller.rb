class CategoriesController < ApplicationController
  def index
    categories = Category.all
    manuals = Manual.all.order('created_at desc')
    datas = [categories, manuals]
    
    render json: datas
  end

  def create
    category = Category.new(category_params)
    category.save

    categories = Category.all
    manuals = Manual.all.order('created_at desc')
    datas = [categories, manuals]
    
    render json: datas
  end

  def create_manual
    manual = Manual.new(manual_params)
    manual.save

    categories = Category.all
    manuals = Manual.all.order('created_at desc')
    datas = [categories, manuals]
    
    render json: datas
  end

  def delete_manual
    manual = Manual.find(params[:id])
    manual.destroy

    categories = Category.all
    manuals = Manual.all.order('created_at desc')
    datas = [categories, manuals]
    
    render json: datas
  end

  def select_category
    manuals = Manual.where(category_id: params[:id])
    categories = Category.all
    datas = [categories, manuals]
    
    render json: datas
  end

  def search_manual
    manuals = Manual.where("job LIKE(?)", "%#{params[:word]}%")
    categories = Category.all
    datas = [categories, manuals]
    
    render json: datas
  end


  private
  def category_params
    params.permit(:name)
  end

  def manual_params
    params.permit(:category_id, :job, :heading, :text)
  end
end
