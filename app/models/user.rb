class User < ActiveRecord::Base

  has_many :gifs

  validates_presence_of :username, :name, :email
  has_secure_password

end
