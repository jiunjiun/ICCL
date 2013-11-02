module IndexHelper
    def carousel
        if params[:controller] == 'index' && params[:action] == 'index'
            render :partial => "common/carousel"
        end
    end
end
