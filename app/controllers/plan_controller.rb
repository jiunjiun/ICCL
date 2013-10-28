class PlanController < ApplicationController
    def index
        @plans = Plan.where(:status => '1').order('updated_at')
    end
end
