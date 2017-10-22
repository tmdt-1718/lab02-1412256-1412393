class UsersController < ApplicationController
  before_action :authenticate, only: [:index, :show]
  before_action :get_user, only: [:show]

    def new
        add_breadcrumb "Register", new_user_path
    end

    def create
        user = User.find_by(email: user_params[:email])
        if user
            flash[:error] = "Cannot register new account."
            render :new
        else
            user = User.create(user_params)
            if user
                flash[:success] = "Register successfully."
                redirect_to login_path
            else
                flash[:error] = "Cannot register new account."
                render :new
            end
        end
    end

    def index
        @users=User.all
        add_breadcrumb "Users", users_path
    end

    def show
        add_breadcrumb "Users", users_path
        add_breadcrumb @user.name, user_path(@user.id)
        #@user.view=1
        #@user.save
        # @user = User.find(params[:id])
        #@user.update(view: @user.view+1)
        #@user.save
    end

    private

    def get_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
