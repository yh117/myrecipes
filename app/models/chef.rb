class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  
  before_save { self.email = self.email.downcase }
  validates :chefname, presence: true, length: { maximum: 40, minimum: 3 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 105 }, 
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
end