class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to ozh4ck5"
      redirect_to @user
    else
      render 'new'
    end
  end

    def index
      @users = User.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
   end
 end

  private

    def user_params
      params.require(:user).permit(:username, :email_address, :password,
                                   :password_confirmation)
    end
end