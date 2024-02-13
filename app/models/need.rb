class Need < ActiveRecord::Base

  belongs_to :customer

  validates :product, :presence => true
  #validates :usage, :presence => true
  #validates :period, :presence => true
  #validates :budget, :presence => true
  #validates :unit, :presence => true

end
