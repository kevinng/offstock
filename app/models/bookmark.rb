class Bookmark < ActiveRecord::Base

  belongs_to :customer
  validates :auction_id, :presence => true, :numericality => true
  
end
