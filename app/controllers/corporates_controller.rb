class CorporatesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @user = User.find_by(id: session[:user_id])
    @corporate = @user.corporates.build
  end
  
  def create
    @user = User.find_by(id: session[:user_id])
    @corporate = @user.corporates.build(params.require(:corporate).permit(:corp_name, :aspiration))
    if @corporate.save
      flash[:success] = "企業の登録に成功しました！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
  end

end
