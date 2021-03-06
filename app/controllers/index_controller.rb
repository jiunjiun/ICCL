class IndexController < ApplicationController
    def index
        @banners = Banner.order(:index).all
        @news = News.order("updated_at").page(params[:page]).per(5)
    end

    def reset
        reset_session
        redirect_to root_path
    end
end
