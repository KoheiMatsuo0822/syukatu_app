class CorporatesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @user = User.find(params[:id])
    @corporates = @user.corporates.build
  end
  
  def destroy
  end

  
end
