class Admin::PaperController < ApplicationController
    load_and_authorize_resource :except => [:show, :create]
    before_filter :paper_statistics, :only => [:index]

    def index
    end

    def type
        case params[:type]
        when 'PA'
            @papers = Paper.PA
        when 'IS'
            @papers = Paper.IS
        when 'DS'
            @papers = Paper.DS
        end
        render :index
    end

    def new
    end

    def create
        @paper = Paper.new(paper_params)
        if @paper.save
            redirect_to admin_paper_index_path
        else
            render new_admin_paper_path
        end
    end

    def edit
    end

    def update
        if @paper.update_attributes(paper_params)
            redirect_to admin_paper_index_path
        else
            render edit_admin_paper_path
        end
    end

    def destroy
        Paper.find(params[:id]).destroy
        redirect_to admin_paper_index_path
    end

    private
    def paper_params
        params.require(:paper).permit(:_type, :year, :name)
    end

    def paper_statistics
        @paper_statistics = {
            All: Paper.all.count,
            PA: Paper.PA.count,
            IS: Paper.IS.count,
            DS: Paper.DS.count
        }
    end
end
