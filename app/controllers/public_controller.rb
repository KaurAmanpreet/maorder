class PublicController < ApplicationController
layout 'front'
  include ApplicationHelper
    before_filter :cart
    before_filter :view
 
  def searchProducts
    @maincategory = Maincategory.where("is_active='1'")
    if params[:id]
      @id = params[:id]
      @products = Product.where("subcategory_id=#{@id}")
    end
    if params.has_key?(:search)
      name = params[:search][:name]
      @products = Product.where("productName like '%#{name}%'")

    end
  end
  def signup
    render :layout => 'application'
  end
  def sellercontact
     @id = params[:id]
    @orders = Orderdetail.where("ordermaster_id=#{@id}")
  end

  def info
    if !session[:products].nil?
        session[:products].each do |p,qty|
        id = p 
        if id == params[:id]
          @value = "1"
          break
        end
        end 
    end
    
    @product = Product.find_by_id(params[:id])
      @category = @product.typee
      @category = @category.capitalize.constantize
      @features = @category.find_by_product_id(@product.id)
      if @features
        keys_blacklist = %W(id product_id user_id created_by updated_by created_at updated_at)
        @feature_showlist = @features.attributes.except(*keys_blacklist)
      end
     
  end

  def addCart
     if params.has_key?(:cart)
      product_id = params[:cart][:product_id]
      qty = params[:cart][:qty]
      hash = {product_id=>qty}
      session[:products] = session[:products] ? session[:products].merge!(hash) : hash
    end
    redirect_to :action=>'cartview'
  end
  def updateCart
    if params[:id]
      if session[:products]
        qty = params[:quantity]
        session[:products][params[:id]] = qty
        updateCartCount
      else
        redirect_to :controller=>"public"
      end
    end
  end
  def saveOrder
    @om = Ordermaster.new()
    @om.user_id = session[:user_id]
    totalQty = 0
    totalCost = 0
    session[:products].each do |pid,qty|
      totalQty+= qty.to_f
      p = Product.find(pid)
      
      totalCost+= qty.to_f * p.price.to_f
    end
    @om.total_products = totalQty
    @om.total_cost = totalCost
    
    if @om.save
      @order_id = @om.id
      saveOrderDetail
      clearCart
      flash[:alert]="your order successfully placed......"
       redirect_to :controller=>'public',:action=>'sellercontact',:id=>@order_id
     else
      @object = @om.errors.full_messages
      render 'public/cartview'
    end
  end
 
  def saveOrderDetail
    
    session[:products].each do |pid,qty|
      @od = Orderdetail.new()
      p = Product.find(pid)
      @od.ordermaster_id = @order_id
      @od.product_id = pid
      @od.cost = p.price
       @od.quantity = qty
      @od.row_total = qty.to_f * p.price.to_f
      @od.save
    end
    return true
  end

  def deleteCart
    if params[:id]
      session[:products].delete(params[:id])
      updateCartCount
      redirect_to :action=>'cartview'
    end 
  end
  def filter
    if params.has_key?(:filter)
      params.each do |key,param|
        # puts key
        param
        # if param == 1
        #   key = param.key
        # end
      end
      @price1 = params[:filter][:price1]
      @price2 = params[:filter][:price2]
      exit!
    end
    
  end
  def myorder
    @order=Ordermaster.where("user_id = #{session[:user_id]}")
    
  end
  def wishlist
    
  end
end
  