class Admin::UserController < ApplicationController
    authorize_resource :class => false
    # load_resource

    def index
        @users = User.where('role != ?', 'GU').all
    end

    def audit
        @users = User.where(:role=> 'GU').all
    end

    def verify
        user = User.find(params[:id])
        user.role = 'US'
        user.save
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
