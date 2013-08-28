class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title,       presence: true
  validates :description, presence: true
  validates_uniqueness_of :description, :scope => :title
  validates :key,         uniqueness: true

  belongs_to :category

  before_create :generate_random_key

  private

  def generate_random_key
    rand_key = (0...8).map{(65+rand(26)).chr}.join
    self.key = rand_key
    if self.valid?
      return self.key
    else
      self.generate_random_key
    end
  end

end
