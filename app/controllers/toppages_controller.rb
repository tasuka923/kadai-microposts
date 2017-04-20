class ToppagesController < ApplicationController
  
  include SessionsHelper
  
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
      redirect_to root_path
    end
  end
end