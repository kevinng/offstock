class Contact < ActiveRecord::Base

  belongs_to :customer

  validates :firstname, :presence => true

  validates :lastname, :presence => true

  validates :email, :presence => true,
    :length => {:minimum => 5, :maximum => 25},
    :uniqueness => true,
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
    :confirmation => true

end
