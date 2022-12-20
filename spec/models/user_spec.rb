require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should return most recent post' do
    recent = User.new.most_recent_post
    expect(recent.length).to be(0)
  end
end
