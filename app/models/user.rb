class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :post_votes
  has_many :comment_votes
	validates :username, presence: true,
                       length: {
                       	minimum: 2,
                       	maximum: 15,
                       	message: "Usernames can only contain letters, digits, dashes and underscores, and should be between 2 and 15 characters long. Please choose another."},
	                     uniqueness: {message: "That username is taken. Please choose another."}
	validates :password, length: { minimum: 3,
																 message: "Passwords should be a least 8 characters. Please choose another. "}

  def self.authenticate(username, password)
    account = self.where(username: username)
    if account.count != 0
      if account[0].password == password
        return account[0]
      end
    end
    return nil
  end

  def self.username_taken(username)
  	!!self.find_by(username: username)
  end
end
