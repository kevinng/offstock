class Product < ActiveRecord::Base

  belongs_to :auction
  belongs_to :customer

  # has_many :categories
  # has_many :good_locations
  
  has_many :visitors
  has_many :product_categories,:dependent => :destroy
  has_many :product_applications,:dependent => :destroy
  has_many :photos,:dependent => :destroy
  has_many :technical_data_sheets,:dependent => :destroy
  has_many :material_safety_data_sheets,:dependent => :destroy
  has_many :coas,:dependent => :destroy

  validates :name, :presence => true
  validates :total_quantity, :presence => true, :numericality => true
  # validates :manufacturer, :presence => true
  # validates :expiry_date, :presence => true
  #validates :warehouse_entry_date, :presence => true

  #validates :packing_weight, :presence => true
  #validates :packing_unit, :presence => true
  #validates :packing_type, :presence => true
  #validates :packing_consume, :presence => true
  #validates :comment, :presence => true
  #validates :reason, :presence => true

  #validates :length, :presence => true
  #validates :width, :presence => true
  #validates :height, :presence => true
  #validates :dimension_unit, :presence => true

  #validates :hs_code, :presence => true
  validates :price_unit, :presence => true

  self.per_page = 3

end
