module API
  module V1
    module Backend
      class Meals < Grape::API
        include API::V1::Defaults

        resource :meals do

          desc "Create a new meal."
          params do
            requires 'meal', type: Hash do
              optional :name
              optional :price
            end
          end
          post '/' do
            meal = Meal.new(declared(params)[:meal].to_h)
            if meal.save
              ::Backend::MealSerializer.new(meal)
            else
              error!(meal.errors, 422)
            end
          end

        end

      end
    end
  end
end
