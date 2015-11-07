class Recipe < ActiveRecord::Base
  belongs_to :chef
  
  validates :name,         presence: true, length: {maximum: 100, minimum: 5}
  validates :summary,      presence: true, length: {maximum: 150, minimum: 10}
  validates :description , presence: true, length: {maximum: 500, minimum: 20}
  validates :chef_id,      presence: true
end