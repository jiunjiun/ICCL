class Study < ActiveRecord::Base
    validates_presence_of :status

    validates :status, numericality: true
    validates :title,  length: {maximum: 100}
    validates :line,   numericality: true

    Classes = {:Master => 'master', :University=> 'university'}
    Classes.each {|key, val| scope key, :conditions => {:classes=> val, :status => '1'}, :order=> 'updated_at'}
end
