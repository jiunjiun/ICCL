class Paper < ActiveRecord::Base
    validates_presence_of :_type, :year, :name
    validates :year, numericality: true

    TYPE = ['PA', 'IS', 'DS']
    TYPE.each {|t| scope t,  :conditions => { :_type => t }, :order => 'year desc'}
end