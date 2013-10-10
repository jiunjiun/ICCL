class News < ActiveRecord::Base
    validates_presence_of :status

    validates :status, :numericality => true
    validates :title,  :maximum => 100
    validates :line,  :numericality => true
end
