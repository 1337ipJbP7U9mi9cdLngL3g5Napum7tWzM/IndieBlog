class Comment < ApplicationRecord
  belongs_to :post
  has_rich_text :body
  validates :body, presence: true
end