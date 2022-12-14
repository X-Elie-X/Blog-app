require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'Posts' do
    it 'should returns http success, and view content' do
      get '/user/:id/posts/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Post detail')
      expect(response).to render_template(:index)
    end
    it 'returns http success, and view content' do
      get '/user/:id/posts/:id/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User Post')
      expect(response).to render_template(:show)
    end
  end
end
