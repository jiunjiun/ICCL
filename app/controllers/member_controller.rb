class MemberController < ApplicationController
    def professor
        @PA = Paper.where(:_type => 'PA').all
        @IS = Paper.where(:_type => 'IS').all
        @DS = Paper.where(:_type => 'DS').all
    end

    def graduate

    end

    def student

    end
end
