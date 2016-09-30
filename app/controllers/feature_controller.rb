class FeatureController < ApplicationController
include ApplicationHelper
layout 'admin'
before_filter :confirm_login
  def feature
  	dp
  end

  def show
    dp
    
    @page_title = "Product Features"
  	if session[:is_admin]
      @product = Product.all
    else
      @product = Product.where("user_id = #{session[:user_id]}")
    end
    if params.has_key?(:search)
      name = params[:search][:name]
      if session[:is_admin]
         @product = Product.where("productName like '%#{name}%'")
      else
        @product = Product.where("user_id = #{session[:user_id]} and productName = '#{name}'")
      end
    end

  end

  def add
    dp
    if session[:is_admin]
      @product = Product.all
    else
      @product = Product.where("user_id = #{session[:user_id]}")
    end
  	
  end
end
