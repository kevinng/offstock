class Phone < ActiveRecord::Base

  belongs_to :customer

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :countrycode, :presence => true
  validates :number, :presence => true

end
