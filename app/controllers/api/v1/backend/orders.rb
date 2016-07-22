module API
  module V1
    module Backend
      class Orders < Grape::API
        include API::V1::Defaults

        resource :orders do

          desc "Return all orders"
          get '/' do
            ActiveModel::ArraySerializer.new(
              Order.all,
              each_serializer: ::Backend::OrderSerializer
              )
          end

          desc "Return a single order by id"
          params do
            requires :id, type: Integer, desc: "Order ID"
          end

          get '/:id' do
            ::Backend::OrderSerializer.new(Order.find(params[:id]))
          end

        end

      end
    end
  end
end