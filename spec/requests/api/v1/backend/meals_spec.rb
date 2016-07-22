require 'rails_helper'

describe API::V1::Backend::Meals do

  describe 'post /api/v1/backend/meals' do
    it 'should create new meal' do
      attrs = FactoryGirl.attributes_for(:meal)
      post "/api/v1/backend/meals", meal: attrs
      expect(response.status).to eq(201)
    end

    it 'should not create new meal with wrong params' do
      attrs = FactoryGirl.attributes_for(:meal)
      attrs[:name] = nil
      post "/api/v1/backend/meals", meal: attrs
      expect(response.status).not_to eq(201)
    end
  end

end