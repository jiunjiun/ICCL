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

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end
end
