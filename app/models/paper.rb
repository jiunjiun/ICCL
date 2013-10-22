class Paper < ActiveRecord::Base
    validates_presence_of :_type, :year, :name
    validates :year, numericality: true
end
