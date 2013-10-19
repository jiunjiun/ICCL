class Admin::NewsController < ApplicationController
    load_and_authorize_resource :except => [:create]
    def index
    end

    def new
    end

    def create
        @news = News.new(news_params)
        if @news.save
            redirect_to admin_news_index_path
        else
            render new_admin_news_path
        end
    end

    def edit
    end

    def update
        if @news.update_attributes(news_params)
            redirect_to admin_news_index_path
        else
            render edit_admin_news_path
        end
    end

    def destroy
        News.find(params[:id]).destroy
        redirect_to admin_news_index_path
    end

    private
    def news_params
        params.require(:news).permit(:status, :title, :content, :line)
    end
end
