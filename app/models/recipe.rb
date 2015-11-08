class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many   :likes
  
  validates :name,         presence: true, length: {maximum: 100, minimum: 5}
  validates :summary,      presence: true, length: {maximum: 150, minimum: 10}
  validates :description , presence: true, length: {maximum: 500, minimum: 20}
  validates :chef_id,      presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        error.add(:picture, "should be less than 5MB")
      end
    end
end