class Backend::OrderSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_name, :status

end
