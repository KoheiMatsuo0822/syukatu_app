class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]
  before_action :user_admin,     only: [:index]
  
  def show
    @user = User.find(params[:id])
    @corporates = @user.corporates.paginate(page: params[:page], per_page: 10)
    @corporate = @corporates.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "アカウント作成に成功しました！"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー設定を更新しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @user = current_user
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:dabger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def user_admin
      if current_user.admin == false
        redirect_to root_path
      end
    end
    
end
