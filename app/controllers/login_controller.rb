class LoginController < ApplicationController
layout 'front'
include ApplicationHelper
before_filter :view
  def login
  end
def authenticate
  	email = params[:user][:email]
  	password = params[:user][:password]
  	@user = User.authenticate_user(email,password)	
  	session[:count_user] = User.count('email', :distinct => true)
  	session[:count_seller] = User.where('is_seller >= "1"').count('email', :distinct => true)
  	
	if @user
    session[:user_id] = @user.id
		session[:name] = @user.userdetail  ? @user.userdetail.name : @user.email;
		session[:email] = @user.email
		session[:is_admin] = @user.is_admin
    if @user.is_active
  		if @user.is_admin || @user.is_seller 
  			redirect_to :controller=>"admin",:action=>'admin'	
  		else
  			redirect_to :controller=>"public",:action=>'view'
  	  end
    else
        redirect_to :controller=>"public",:action=>'view'
    end
	 else
	  	redirect_to :controller=>"public",:action=>'view'
  end
  end
  def logout
  	 session[:email] = nil
    session[:id] = nil
    session[:name] = nil
    session[:products] = nil
    session[:cart_size] = nil
		redirect_to :controller=>'public',:action=>'view'
  end

end
