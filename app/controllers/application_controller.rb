  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_login
      if session[:email]
        return true
      else
        redirect_to :controller=>'public',:action=>'view'
        return false
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
  def dp
       if session[:email]
      @uid= session[:user_id]
      @details =Userdetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'public',:action=>'view'
      end
  end
  def clearCart
    session[:products]=nil
    session[:cart_size]=nil
  end

end
