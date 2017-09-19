class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_presence_of :content
  validates_length_of :content, maximum: 255, message: "Comment cannot be longer than 255 characters"
end
