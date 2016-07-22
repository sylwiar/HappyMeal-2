namespace :api do
  desc 'API Routes'
  task routes: :environment do
    API::V1::Base.routes.each do |api|
      method = api.route_method.ljust(10)
      path = api.route_path
      desc = api.route_description.try(:ljust, 10)
      puts "\t#{method}\t/api#{path}\t#{desc}"
    end
  end
end