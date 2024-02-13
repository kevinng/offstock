class Admin < User

  ADMIN_TYPE_TYPE = [
    # [displayed, stored in database]
    ['Admin', 'Admin'], # Everything
    ['System', 'System'], # System Issue
    ['Webmaster', 'Webmaster'], # Full Site Support
    ['Clerk', 'Clerk'] # Limited Access
  ]
  validates_inclusion_of :admin_type, :in => ADMIN_TYPE_TYPE.map {|display, value| value}

end
