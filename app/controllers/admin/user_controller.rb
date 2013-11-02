class Admin::UserController < ApplicationController
    authorize_resource :class => false
    # load_resource

    def index
        @users = User.where(:role=> ['SU', 'UE']).all
    end

    def graduation
        @users = User.GR
    end

    def audit
        @users = User.GU
    end

    def verify
        User.find(params[:id]).update_attributes!(:role => 'UE')
        redirect_to admin_user_audit_path
    end

    # def show
    # end

    # def new
    # end

    # def create

    # end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to admin_user_index_path
        else
            render edit_admin_uesr_path
        end
    end

    # def destroy

    # end

    private
    def user_params
        params.require(:user).permit(:role)
    end
end
