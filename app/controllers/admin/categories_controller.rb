class Admin::CategoriesController < ApplicationController
  layout 'admin'  
  
  def index
    @categories = Category.find(:all)
  end  
  
  def new
     @category = Category.new
  end  
  
  def create
    @category = Category.new(params[:category])
    
    respond_to do |wants|
      if @category.save
        wants.html { redirect_to admin_categories_path }
      else
        wants.html { render :action => "new" }
      end
    end
  end 
  
  def reset_count
    ['北京','上海'].each do |city|
      Category.city_equals(city).each do |city_cate|
        case city_cate.filter
        when '地区'
          city_cate.update_attributes(:vendors_count => Vendor.address_like(city_cate.name).length) 
        when '菜系'  
          case city_cate.name
            when '面包甜点'        
              city_cate.update_attributes(:vendors_count => Vendor.category_equals('面包').length)    
            when '自助餐'                       
              city_cate.update_attributes(:vendors_count => Vendor.category_equals('自助').length) 
            when '新疆清真' 
              city_cate.update_attributes(:vendors_count => Vendor.category_like('新疆').length)
            else                                            
              city_cate.update_attributes(:vendors_count => Vendor.category_like(city_cate.name).length)
           end
         when '均价'
           case city_cate.name
           when '50-80' 
            city_cate.update_attributes(:vendors_count => Vendor.avg_gte(50).avg_lte(80).count)
           when '80-140'           
            city_cate.update_attributes(:vendors_count => Vendor.avg_gte(81).avg_lte(140).count)
          when '140-200'
            city_cate.update_attributes(:vendors_count => Vendor.avg_gte(141).avg_lte(200).count)
          when '201以上'
            city_cate.update_attributes(:vendors_count => Vendor.avg_gt(200).count)  
          end
        end
      end
    end
    
    respond_to do |wants|
      wants.html { redirect_to admin_categories_path }
    end
  end 
  
end
