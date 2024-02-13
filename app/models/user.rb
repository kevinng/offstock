require 'digest/sha2'

class User < ActiveRecord::Base

  USER_STATUS_TYPE = [
    # [displayed, stored in database]
    ['Live', 'Live'],
    ['Paused', 'Paused'],
    ['Disabled', 'Disabled']
  ]

  # Create two virtual (in memory only) attributes to hold the password and its confirmation.
  attr_accessor :new_password

  validates :username, :presence => true,
    :length => {:minimum => 6, :maximum => 25},
    :uniqueness => true

  validates :lastname, :presence => true
  validates :firstname, :presence => true
  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 25},
    :uniqueness => true,
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
    :confirmation => true

  validates :password,
    :presence => true,
    :length => {:minimum => 6},
    :confirmation => true

  validates_inclusion_of :status, :in => USER_STATUS_TYPE.map {|display, value| value}

  before_save :hash_new_password, :if=>:password_changed?

  # By default the form_helpers will set new_password to "",
  # we don't want to go saving this as a password
  def password_changed?
    !@new_password.blank?
  end

  # As is the 'standard' with rails apps we'll return the user record if the
  # password is correct and nil if it isn't.
  def self.authenticate(username, password)
    # Because we salt the passwords we can't do this query in one part, first
    # we need to fetch the potential user
    if user = find_by_username(username)
      # Then compare the provided password against the hashed one in the db.
      if user.password == Digest::SHA2.hexdigest(user.salt + password)
        # If they match we return the user
        return user
      end
    end
    # If we get here it means either there's no user with that email, or the wrong
    # password was provided.  But we don't want to let an attacker know which.
    return nil
  end

  def self.send_new_password(username)

    if user = find_by_username(username)

      newpassword = ActiveSupport::SecureRandom.hex(4)
      user.password = Digest::SHA2.hexdigest(user.salt + newpassword)
      user.save
      # Send an notice to user email address.
      return true
   
    end
    return nil
  end

  private
  # This is where the real work is done
  def hash_new_password
    # First reset the salt to a new random string.  You could choose a
    # longer string here but for a salt, 8 bytes of randomness is probably
    # fine.  Note this uses SecureRandom which will use your platform's secure
    # random number generator.
    self.salt = ActiveSupport::SecureRandom.base64(8)
    # Now calculate the hash of the password, with the salt prepended, store
    # store that in the database
    self.password = Digest::SHA2.hexdigest(self.salt + @new_password)
  end

end
