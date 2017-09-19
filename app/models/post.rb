class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :content
  validates_length_of :content, maximum: 255, message: "Comment cannot be longer than 255 characters"
end
