class Post < ActiveRecord::Base
	validates :title, presence: true
	has_many :post_votes
	belongs_to :user
	has_many :comments

end
