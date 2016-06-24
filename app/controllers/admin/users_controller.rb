class Admin::UsersController < ApplicationController


  def index
  	@users = User.all
  end


  def destroy
  	user = User.find(params[:id])
  	@user = user.destroy
  end

end


<a href="/admin/users/1"/>
