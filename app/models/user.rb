class User < ActiveRecord::Base
    validates_presence_of :fb_id, :name, :email, :token
    validates :email, format: {:with=> /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}

    validates :classes, :uniqueness => { :allow_blank => true}
end
