class UsersController < ApplicationController
    def sign_in
    end

    def auth_fb
        auth_hash = request.env['omniauth.auth']
        if auth_hash
            authUser = User.where(:fb_id=> auth_hash['uid']).first
            if authUser
                authUser.update_attributes(:token => auth_hash['credentials']['token'])
            else
                authUser = User.new(:fb_id => auth_hash['uid'],
                                    :token => auth_hash['credentials']['token'],
                                    :name  => auth_hash['info']['name'],
                                    :email => auth_hash['info']['email'])
                authUser.save
                flash[:first] = '1'
            end
            session[:UserInfo] = { :id => authUser.id }
            redirect_to sign_up_path
        else
            redirect_to sign_failure_path
        end
    end

    def sign_up
        if !flash[:first]
            redirect_to root_path
        end
        @user = User.find(session[:UserInfo][:id])
    end

    def sign_upping
        @user = User.find(params[:user][:id]).update_attributes(user_params)
        redirect_to root_path
    end

    def sign_out
        session.delete(:UserInfo)
        redirect_to root_path
    end

    def failure
        flash[:notice] = 'failure'
        # redirect_to root_path
    end

    def user_params
        params.require(:user).permit(:classes, :name, :email, :phone)
    end
end
