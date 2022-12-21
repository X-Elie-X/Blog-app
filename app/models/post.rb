class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post_counter
  def update_post_counter
    author.increment!(:post_counter)
  end

  def most_recent_comments
    Comment.includes(:author).order(created_at: :desc).limit(5)
  end
end
