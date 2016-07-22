module API
  module V1
    class Base < Grape::API

      rescue_from :all do |e|
        if Rails.env.development? || Rails.env.test?
          raise e
        else
          error_response({ message: "Internal server error" })
        end
      end

      namespace :backend do
        mount API::V1::Backend::Orders
      end

    end
  end
end
