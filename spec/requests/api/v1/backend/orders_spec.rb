require 'rails_helper'

describe API::V1::Backend::Orders do

  describe 'get /api/v1/backend/orders' do
    it 'should return all orders' do
      22.times { FactoryGirl.create :order }
      get '/api/v1/backend/orders'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json.size).to eq(22)
    end
  end

  describe 'get /api/v1/backend/orders/:id' do
    it 'should return one order' do
      order = FactoryGirl.create(:order)
      get "/api/v1/backend/orders/#{order.id}"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['order']['restaurant_name']).to eq(order.restaurant_name)
    end
  end

end
