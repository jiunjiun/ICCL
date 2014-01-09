class Admin::BannerController < ApplicationController
    before_action :set_banner, only: [:destroy]
    before_action :redirect_to_inde, only: [:show, :edit, :update]

    def index
        @banners = Banner.order(:index).all
        @banner = Banner.new
    end

    def new
        @banner = Banner.new
    end

    def create
        @banner = Banner.new(banner_params)
        respond_to do |format|
            if @banner.save
                format.html {
                    render :json => [@banner.to_jq_upload].to_json, :content_type => 'text/html', :layout => false
                }
                format.json { render json: {files: [@banner.to_jq_upload]}}
            else
                format.html { render action: "new" }
                format.json { render json: @banner.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
        @banner.destroy
        respond_to do |format|
          format.html
          format.json { render :json => {} }
        end
    end

    def update_indexs
      @index = params[:indexs]
      if @index
          @index.each do |i, j|
            Banner.find(i).update_attributes(:index => j)
          end
      end

      respond_to do |format|
        format.json { render :json => {'status' => 'ok'} }
      end
    end

    private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:file, :index)
    end

    def redirect_to_inde
      redirect_to admin_banner_index_path
    end
end
