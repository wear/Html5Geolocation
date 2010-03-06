class UsersController < ApplicationController

  # render new.rhtml
  def new
    @user = User.new
  end  
  
  
  def new_mobile   
    @mobile_user = User.new
    @vendor = Vendor.find(params[:vendor_id]) 
    respond_to do |wants|
      wants.html {  }
      wants.js { render :layout => false }
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save  
      if success && @user.errors.empty?    
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      wants.html { redirect_back_or_default('/') }
    else
     render :action => 'new' 
    end 
  end
end
