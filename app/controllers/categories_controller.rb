class CategoriesController < ApplicationController 
  def show     
    @search = true
    set_filter
    @specify_category = Category.find(params[:id])
    @vendors = set_category(@specify_category).find(:all,:limit => 30,:order => 'sum DESC')
  end     
  
  protected
  
  def set_category(cate)
      case cate.filter
      when '地区'
       Vendor.address_like(cate.name)
      when '菜系'  
        case cate.name
          when '面包甜点'        
            Vendor.category_equals('面包') 
          when '自助餐'                       
            Vendor.category_equals('自助') 
          when '新疆清真' 
            Vendor.category_like('新疆')
          else                                            
            Vendor.category_like(cate.name)
         end
       when '均价'
         case cate.name
         when '50-80' 
           Vendor.avg_gte(50).avg_lte(80)
         when '80-140'           
           Vendor.avg_gte(81).avg_lte(140)
        when '140-200'
           Vendor.avg_gte(141).avg_lte(200)
        when '201以上'
           Vendor.avg_gt(200)  
        end
      end
  end             
  
end
