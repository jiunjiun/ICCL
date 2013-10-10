class User < ActiveRecord::Base
    validates_presence_of :status, :fb_id, :name, :email, :token

    validates :status, :numericality => true
    validates :email, :format => {:with=> /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}
end
