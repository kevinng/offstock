class AuctionQuestionAnswer < ActiveRecord::Base

  belongs_to :auction

  STATUS_TYPE = [
    # [displayed, stored in database]
    ['Deleted', 'Deleted'], # Deleted message, only site administrator can recovery it.
    ['Disabled', 'Disabled'], # Site administrator disabled this message
    ['Pending', 'Pending'], # Site administrator approved and validated the initial post, therefore seller can view it now.
    ['Post to Seller', 'Post_To_Seller'], # Waiting for site administrator to review seller reply.
    ['Seller Replied', 'Seller_Replied'],  # Waiting for site administrator to review seller reply.
    ['Live', 'Live'] # Site administrator validated seller reply. It shall available for buyer to read.
    # sale listings are never deleted.
  ]

  validates_inclusion_of :status, :in => STATUS_TYPE.map {|display, value| value}
  
end
