class Post < ActiveRecord::Base
	validates :title, presence: true
	has_many :post_votes
	belongs_to :user
	has_many :comments

  def self.top
    order('post_votes_count DESC')
  end
end
