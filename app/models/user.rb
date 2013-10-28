class User < ActiveRecord::Base
    validates_presence_of :fb_id, :name, :email, :token
    validates :email, format: {:with=> /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}

    validates :classes, :inclusion => %w(master university)

    Classes = {:Master => 'master', :University=> 'university'}
    Classes.each{|key, val| scope key, :conditions => {:classes=> val, :role=> ['SU', 'UE']}, :order => 'name' }

    Role = [:GR, :GU]
    Role.each{|val| scope val, :conditions => {:role => val}, :order => 'name'}
    # scope :GR,  :conditions => {:role => 'GR'}, :order => 'name'
end