class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter_post
    posts.increment!(:comments_counter)
  end
end
