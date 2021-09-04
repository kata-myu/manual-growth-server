class CategoriesController < ApplicationController
  def index
    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)   #"http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--01d21489fc6dde0976835a9802e93d342837d5e7/background-image.jpg"のようなURLができる
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def create
    category = Category.new(category_params)
    category.save

    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)  
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def create_manual
    manual = Manual.new(manual_params)
    manual.save

    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)  
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def delete_manual
    manual = Manual.find(params[:id])
    manual.destroy

    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)  
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def select_category
    manuals = Manual.where(category_id: params[:id])
    categories = Category.all

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)  
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def search_manual
    manuals = Manual.where("title LIKE(?)", "%#{params[:word]}%")
    categories = Category.all

    manuals.each_with_index do |manual, i|
      if manual.image.present?
        manuals[i][:image_url] = url_for(manual.image)  
      else
        manuals[i][:image_url] = "no image" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end


  private
  def category_params
    params.permit(:name)
  end

  def manual_params
    if params[:image] == ""
      params.delete(:image)
    end
    params.permit(:category_id, :title, :heading, :text, :image)
  end
end
