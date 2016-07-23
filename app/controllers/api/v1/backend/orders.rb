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

          desc "Create new order"
          params do
            requires 'order', type: Hash do
              optional :restaurant_name
              optional :status
            end
          end
          post '/' do
            order = Order.new(declared(params)[:order].to_h)
            if order.save
              ::Backend::OrderSerializer.new(order)
            else
              error!(order.errors, 422)
            end
          end

          desc "Update an order"
          params do
            requires 'order', type: Hash do
              optional :restaurant_name
              optional :status
            end
          end
          patch '/:id' do
            order = Order.find(params[:id])
            if order.update_attributes(declared(params)[:order].to_h.delete_if {|k, v| v.nil?})
              ::Backend::OrderSerializer.new(order)
            else
              error!(order.errors.full_messages, 422)
            end
          end

        end

      end
    end
  end
end