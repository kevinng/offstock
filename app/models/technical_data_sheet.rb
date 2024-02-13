class TechnicalDataSheet < ActiveRecord::Base

  belongs_to :product

  has_attached_file :tds,
    :url => "/uploads/tds/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/tds/:id/:style_:basename.:extension"

  validates_attachment_presence :tds
  
end
