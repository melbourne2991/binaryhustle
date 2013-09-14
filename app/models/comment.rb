class Comment < ActiveRecord::Base
	has_many :replies, class_name: "Comment", foreign_key: "original_id"

	belongs_to :user
	belongs_to :post
	belongs_to :original, class_name: "Comment"
end
