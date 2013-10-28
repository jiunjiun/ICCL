class StudyController < ApplicationController
    def show
        @study = Study.find(params[:id])
    end

    def master
        @Masters = Study.Master
    end

    def university
        @Universitys = Study.University
    end
end
