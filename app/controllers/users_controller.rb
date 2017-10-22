class UsersController < ApplicationController
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

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
