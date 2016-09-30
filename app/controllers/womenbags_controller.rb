class WomenbagsController < ApplicationController
  
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp

  def womenbags
    @page_title = "Women Bags Details" 
    @women =Womenbag.all
   addFeature
  end

  def addbag
  	womenbags
    @users = User.all
    @product = Product.all
  	@wb = Womenbag.new(bag_params)
  	if @wb.valid?
  		@wb.save
      @id = @wb.product_id
  		@u_id = @wb.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @wb.errors.full_messages
  		render 'womenbags'
  	end
  end


  
  def edit 
    @page_title = "Women Bags Details" 
   editFeature
    @id = params[:id]
    @womenbag = Womenbag.find_by_product_id(@id)
    if @womenbag
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateWomen
    womenbags
    @womenbag=Womenbag.find(params[:id])
    if @womenbag.valid?
      @womenbag.update_attributes(bag_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@womenbag.errors.full_messages
     render 'edit'
    end
  end
  def view
    
    @page_title = "Women Bags Details" 
    womenbags
    @id = params[:id]
    @womenbag = Womenbag.find_by_product_id(@id)
    if @women 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end

  # def show
  #   womenbags
  # end

  def bag_params
    return params.require(:womenbag).permit(:product_id,:user_id,:color,:material,:created_by,:updated_by)
  end
end
