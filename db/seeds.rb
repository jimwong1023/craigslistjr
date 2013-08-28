require 'faker'
require 'titleize'

10.times do |i|
  cat = Category.create!(:category_name => Faker::Lorem.words(num = rand(1..3)).join(' ').titleize)
  15.times { |i| Post.create!(:title => Faker::Lorem.words(num = rand(1..3)).join(' ').titleize,
                    :description => Faker::Company.catch_phrase,
                    :category_id => cat.id) }
end