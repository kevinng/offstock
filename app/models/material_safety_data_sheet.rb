class MaterialSafetyDataSheet < ActiveRecord::Base

  belongs_to :product

  has_attached_file :msds,
    :url => "/uploads/msds/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/msds/:id/:style_:basename.:extension"

  validates_attachment_presence :msds
  
  # validates_attachment_content_type :msds, :content_type => 'application/pdf'
  
end
