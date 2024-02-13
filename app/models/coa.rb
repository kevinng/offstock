class Coa < ActiveRecord::Base

  belongs_to :product

  has_attached_file :coa,
    :url => "/uploads/coa/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/coa/:id/:style_:basename.:extension"

  validates_attachment_presence :coa
    
end
