class Admin::StudyController < ApplicationController
    load_and_authorize_resource :except => [:create]
    before_filter :study_statistics, :only => [:index, :master, :university]

    def index
    end

    def master
        @studies = Study.Master.all
    end

    def university
        @studies = Study.University.all
    end

    def new
    end

    def create
        @study = Study.new(study_params)
        if @study.save
            redirect_to admin_study_index_path
        else
            render new_admin_study_path
        end
    end

    def edit
    end

    def update
        if @study.update_attributes(study_params)
            redirect_to admin_study_index_path
        else
            render edit_admin_study_path
        end
    end

    def destroy
        Study.find(params[:id]).destroy
        redirect_to admin_study_index_path
    end

    private
    def study_params
        params.require(:study).permit(:status, :title, :content, :line, :classes)
    end

    def study_statistics
        @study_statistics = {
            All: Study.count,
            Master: Study.Master.count,
            University: Study.University.count
        }
    end
end
