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

  describe 'post /api/v1/backend/orders' do
    it 'should create new order' do
      attrs = FactoryGirl.attributes_for(:order)
      post "/api/v1/backend/orders", order: attrs
      expect(response.status).to eq(201)
    end

    it 'should not create new order with wrong params' do
      attrs = FactoryGirl.attributes_for(:order)
      attrs[:restaurant_name] = nil
      post "/api/v1/backend/orders", order: attrs
      expect(response.status).not_to eq(201)
    end
  end

  describe 'patch /api/v1/backend/orders/:id' do
    it 'should update order' do
      order = FactoryGirl.create(:order)
      attrs = FactoryGirl.attributes_for(:order)
      attrs[:restaurant_name] = "new"
      patch "/api/v1/backend/orders/#{order.id}", order: attrs
      json = JSON.parse(response.body)
      expect(json["order"]["restaurant_name"]).to eq("new")
    end
  end

end
