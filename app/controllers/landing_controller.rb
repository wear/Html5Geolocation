class LandingController < ApplicationController 
  
  def index     
     @search = true
     #@vendors = Vendor.find(:all,:limit => 30)                    
     set_filter
  end      
  
  def get_nearby
    @vendors = Vendor.find(:all,:origin =>[params[:lat],params[:lng]],
                           :conditions => "distance < 0.8")
    
    respond_to do |wants|
      wants.js { render :json => @vendors }
    end
  end     
  
  def set_nearby 
    @vendors = Vendor.find(:all,:origin =>[params[:lat],params[:lng]],
                           :conditions => "distance < 0.8",:order => 'sum DESC')
                           
    respond_to do |wants|
      wants.js { }
    end
  end            
  
  def set_cate_nearby
    @vendors = Vendor.find(:all,:origin =>[params[:lat],params[:lng]],
                           :conditions => ["distance < ? and category = ?",0.8,params[:category]],:order => 'sum DESC')
    
    respond_to do |wants|
       wants.js { 
         render :update do |page|
           page.replace_html 'vendor_list',:partial => '/shared/vendor',:collection => @vendors
         end
         }
    end
  end
  
end
