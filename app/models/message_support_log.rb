class MessageSupportLog < ActiveRecord::Base
  
  MESSAGELOG_STATUS_TYPE = [
    # [displayed, stored in database]
    ['Read', 'Read'],
    ['Unread', 'Unread']
  ]
  
  belongs_to :customer

  validates_inclusion_of :status, :in => MESSAGELOG_STATUS_TYPE.map {|display, value| value}
    
end
