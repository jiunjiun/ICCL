class Admin::PlanController < ApplicationController
    load_and_authorize_resource :except => [:create]
    def index
    end

    def new
    end

    def create
        @plan = Plan.new(plan_params)
        Rails.logger.debug('++++++++++  #{@plan}')
        if @plan.save
            redirect_to admin_plan_index_path
        else
            render :action=> :new
        end
    end

    def edit
    end

    def update
        if @plan.update_attributes(plan_params)
            redirect_to admin_plan_index_path
        else
            render :action=> :edit
        end
    end

    def destroy
        Plan.find(params[:id]).destroy
        redirect_to admin_plan_index_path
    end

    private
    def plan_params
        params.require(:plan).permit(:status, :title, :content, :line)
    end
end
