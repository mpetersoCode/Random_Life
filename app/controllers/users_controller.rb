class UsersController < ApplicationController
  before_filter :correct_user, only: [:edit, :delete]
  
  def new
    @user = User.new
    @user.assets.build 
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = @user.microposts.build
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if signed_in? 
        @user = User.find(params[:id]) 
    else
        flash[:error] = "Must be logged in to do that"
        redirect_to root_path
    end
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to @user
      else
        render 'edit'
      end
    end
    
    def index
      @users = User.all
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User Deleted"
      redirect_to root_path
    end
    
    def photos
      if signed_in? 
          @user = User.find(params[:id])
      else
          flash[:error] = "Must be logged in to do that"
          redirect_to root_path
      end
    end
    
    private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def add_asset temp
      @user.assets = @user.assets.to_a.push temp # yes, works even if @listofbooks.nil?
    end
end
