class TransactionTtReceipt < ActiveRecord::Base

  belongs_to :transaction

  has_attached_file :ttreceipt,
    :url => "/uploads/ttreceipt/:id/:style_:basename.:extension" ,
    :path => ":rails_root/public/uploads/ttreceipt/:id/:style_:basename.:extension"

  validates_attachment_presence :ttreceipt

  
end
