class LabController < ApplicationController
    load_and_authorize_resource :class => LabController

    def contact
        @Master     = User.Master
        @University = User.University
    end

    def rule

    end

    def service

    end
end
