class VendorsController < ApplicationController 
  def index        
    @search = true
    set_filter
    @vendors = Vendor.name_like(params[:query]).find(:all,:limit => 30,:order => 'sum DESC')
  end
end
