class CategoriesController < ApplicationController
  def index
    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.images.present?
        images = ""
        manual.images.each_with_index do |image, i| 
          images = images + url_for(image) + ","
        end
        manuals[i][:image_url] = images
      else
        manuals[i][:image_url] = "no images" 
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
      if manual.images.present?
        images = ""
        manual.images.each_with_index do |image, i| 
          images = images + url_for(image) + ","
        end
        manuals[i][:image_url] = images
      else
        manuals[i][:image_url] = "no images" 
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
      if manual.images.present?
        images = ""
        manual.images.each_with_index do |image, i| 
          images = images + url_for(image) + ","
        end
        manuals[i][:image_url] = images
      else
        manuals[i][:image_url] = "no images" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def update_manual
    manual = Manual.find(params[:id])
    manual.update(manual_params)

    categories = Category.all
    manuals = Manual.all.order('created_at desc')

    manuals.each_with_index do |manual, i|
      if manual.images.present?
        manuals[i][:image_url] = url_for(manual.images)  
      else
        manuals[i][:image_url] = "no images" 
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
      if manual.images.present?
        manuals[i][:image_url] = url_for(manual.images)  
      else
        manuals[i][:image_url] = "no images" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def select_category
    manuals = Manual.where(category_id: params[:id])
    categories = Category.all

    manuals.each_with_index do |manual, i|
      if manual.images.present?
        manuals[i][:image_url] = url_for(manual.images)  
      else
        manuals[i][:image_url] = "no images" 
      end
    end

    datas = [categories, manuals]
    render json: datas
  end

  def search_manual
    manuals = Manual.where("title LIKE(?)", "%#{params[:word]}%")
    categories = Category.all

    manuals.each_with_index do |manual, i|
      if manual.images.present?
        manuals[i][:image_url] = url_for(manual.images)  
      else
        manuals[i][:image_url] = "no images" 
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
    if params[:images] == ""
      params.delete(:images)
    else
      images = []
      images.push(params[:images0])
      images.push(params[:images1]) if params[:images1] 
      images.push(params[:images2]) if params[:images2] 
      params[:images] = images
    end
    params.permit(:category_id, :title, :heading, :text, images: [])
  end
end
