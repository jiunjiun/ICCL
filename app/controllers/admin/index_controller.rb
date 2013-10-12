class Admin::IndexController < ApplicationController
    authorize_resource :class => false

    def index
    end
end
