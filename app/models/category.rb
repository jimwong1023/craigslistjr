class Category < ActiveRecord::Base
  # Remember to create a migration!
  validates :category_name, presence: true
  
  has_many :posts, dependent: :destroy
end
