class Plan < ActiveRecord::Base
    validates_presence_of :status

    validates :status, numericality: true
    validates :title,  length: {maximum: 100}
    validates :line,   numericality: true
end
