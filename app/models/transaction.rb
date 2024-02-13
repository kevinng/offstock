class Transaction < ActiveRecord::Base

  # One Transaction for one auction
  TRANSACTION_ROLE_TYPE = [
    # [displayed, stored in database]
    ['Seller', 'Seller'],
    ['Buyer', 'Buyer']
  ]

  TRANSACTION_STATUS_TYPE = [
    # [displayed, stored in database]
    ['Deleted', 'Deleted'], # Transaction Deleted By Administrator or System
    ['ForceClosed', 'ForceClosed'], # Transaction Deleted By Administrator or System
    ['Disabled', 'Disabled'], # Temporary Hold
    ['PaymentRequired', 'PaymentRequired'], # Awaiting Payment from Buyer
    ['PrepareGood', 'PrepareGood'],  # Seller Prepared Good
    ['UnprepareGood', 'UnprepareGood'],  # Seller Unprepared Good
    ['ApproveGood', 'ApproveGood'], # Buyer Accepted Goods
    ['UnapproveGood', 'UnapproveGood'], # Buyer Un-accepted Goods
    ['RejectGood', 'RejectGood'], # Buyer Rejected Goods
    ['ArrangeTransportShipGood', 'ArrangeTransportShipGood'], # Two transaction states. Logistic
    ['Shipped', 'Shipped'], # Goods shipped from Seller 
    ['Success', 'Success'], # Transaction Completed and Successful
    ['Returned', 'Returned'], # Goods to Seller
    ['BuyerCancel', 'BuyerCancel'], # Buyer decided to Cancel this transaction
    ['SellerCancel', 'SellerCancel'] # Seller decided to Cancel this transaction

  ]

  belongs_to :customer
  has_many :receipts  
  has_many :transaction_sgrves
  has_many :transaction_tt_receipts
 

  validates_inclusion_of :role, :in => TRANSACTION_ROLE_TYPE.map {|display, value| value}
  validates_inclusion_of :status, :in => TRANSACTION_STATUS_TYPE.map {|display, value| value}
    
end
