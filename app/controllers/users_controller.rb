class UsersController < ApplicationController


  def show
    redirect_to (welcome_index_path) if current_user.blank?
    @user = current_user
      #@posts = @user.posts.visible_to(current_user)
  end

  def new
  	end

  #### end class
  end
