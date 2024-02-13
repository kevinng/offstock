class TransactionSgrf < ActiveRecord::Base

  belongs_to :transaction

  has_attached_file :sgrf,
    :url => "/uploads/sgrf/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/sgrf/:id/:style_:basename.:extension"

  validates_attachment_presence :sgrf

  
end
