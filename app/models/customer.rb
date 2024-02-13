class Customer < User

  has_many :contacts
  has_many :addresses
  has_many :phones
  has_many :needs
  has_many :bookmarks
  has_many :message_support_logs
  has_many :transactions

  has_many :products
  has_many :auctions

  validates :companyname, :presence => true
  validates :country, :presence => true
 
end
