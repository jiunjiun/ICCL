class News < ActiveRecord::Base
    validates_presence_of :status

    validates :status, numericality: true
    validates :title,  length: {maximum: 100}
    validates :line,   :numericality=> true, :presence=> { :message => "Story title is required" }
end
