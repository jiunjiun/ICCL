module MemberHelper
    def getWork_history(token)
        @graph = Koala::Facebook::API.new(token)
        @graph.get_object("me")['work'][0]['employer']['name']
    end
end
