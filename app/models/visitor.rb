class Visitor < ActiveRecord::Base

  # acts_as_predecessor

  belongs_to :product
  belongs_to :auction
  
end
