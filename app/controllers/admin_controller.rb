class AdminController < ApplicationController
	layout 'admin'
	include ApplicationHelper
  def admin
  	dp

  	session[:count_user] = User.count('email', :distinct => true)
  	session[:count_seller] = User.where('is_seller >= "1"').count('email', :distinct => true)
  end
  def error_msg
  	
  end
  def dp
    if session[:email]
      @uid= session[:user_id]
      @details =Userdetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'login',:action=>'login'
      end
  end
  def vieworder
    @order=Ordermaster.all
  end
end
