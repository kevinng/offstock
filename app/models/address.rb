class Address < ActiveRecord::Base

  belongs_to :customer

  validates :name, :presence => true, :uniqueness => true
  validates :addressline1, :presence => true
  validates :addressline2, :presence => true

  validates :city, :presence => true
  validates :state, :presence => true
  validates :country, :presence => true
  
end
