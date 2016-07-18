require 'rails_helper'

describe Api::V1::ReplitController, type: :controller do
  describe 'GET /api/v1/replit' do
    it 'returns a replit token as a json object' do
      get :show

      json = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(json.keys).to include('msg_mac')
      expect(json.keys).to include('time_created')
    end
  end
end
