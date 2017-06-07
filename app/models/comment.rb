class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 145 }
  validates :commenter, presence: true
  validates :article_ref, presence: true
end
