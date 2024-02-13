class Auction < ActiveRecord::Base

  AUCTION_STATUS_TYPE = [
    # [displayed, stored in database]
    ['Live', 'Live'],
    ['Paused', 'Paused'],
    ['Deleted', 'Deleted'],
    ['Approved', 'Approved'],
    ['Unapproved', 'Unapproved'],
    ['Pending', 'Pending']
  ]

  belongs_to :customer
    
  has_many :products
  has_many :visitors
  has_many :auction_question_answers
  # has_many :good_locations

  has_many :bids

  validates :name, :presence => true
  #validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :timezone, :presence => true

  #validates :length, :presence => true
  #validates :width, :presence => true
  #validates :height, :presence => true
  #validates :address_id, :presence => true
  validates_inclusion_of :status, :in => AUCTION_STATUS_TYPE.map {|display, value| value}

end
