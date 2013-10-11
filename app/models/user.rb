class User < ActiveRecord::Base
    validates_presence_of :fb_id, :name, :email, :token

    validates :status, numericality: true
    validates :email, format: {:with=> /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}

    validates :classes, numericality: true,
                        allow_blank: true
end
