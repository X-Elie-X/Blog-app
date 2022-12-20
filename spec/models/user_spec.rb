require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     post_counter: 1)
 
  it 'should return most recent post' do
    recent = User.new.most_recent_post
    expect(recent.length).to be(0)
  end
end
