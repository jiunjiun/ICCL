class MemberController < ApplicationController
    def professor
        @PA = Paper.PA
        @IS = Paper.IS
        @DS = Paper.DS
    end

    def graduate
        @Graduate   = User.GR
    end

    def student
        @Master     = User.Master
        @University = User.University
    end
end
