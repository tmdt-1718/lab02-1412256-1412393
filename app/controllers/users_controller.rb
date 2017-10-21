class UsersController < ApplicationController
    before_action :get_user, only: [:show]
    
        def index
            @users=User.all
            add_breadcrumb "Users", users_path
        end
        

        
        def show
            add_breadcrumb "Users", users_path
            add_breadcrumb @user.username, user_path(@user.id)
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
        

end
