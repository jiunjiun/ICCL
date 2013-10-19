class ImsuController < ApplicationController
    http_basic_authenticate_with :name => Setting.imsu_name, :password => Setting.imsu_passwd

    def index
        @users = User.where("role !=?", 'SU').all
    end

    def update
        @user = User.find(params[:id])
        @user.role = 'SU'
        @user.save
        redirect_to im_su_path
    end
end
