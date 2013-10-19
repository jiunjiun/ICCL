class Admin::StudyController < ApplicationController
    load_and_authorize_resource :except => [:create]
    def index
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
        params.require(:study).permit(:status, :title, :content, :line)
    end
end
