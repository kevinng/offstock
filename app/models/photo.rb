class Photo < ActiveRecord::Base

  belongs_to :product

  has_attached_file :photo,
    :url => "/uploads/photo/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/photo/:id/:style_:basename.:extension",
    :styles => {:thumb => "70x70>" , :mid => "170x170>", :special => "120x85" }

  validates_attachment_presence :photo
    
end
