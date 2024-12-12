class VehicleFactory
    def create_vehicles(dataset)
        vehicles = []
        dataset.each do |vehicle|
            new_vehicle = Vehicle.new({
                :vin=>vehicle[:vin_1_10],
                :year=>vehicle[:model_year],
                :make=>vehicle[:make],
                :model=>vehicle[:model],
                :engine=>vehicle.include?(:electric_range) ? :ev : :ice
            })
            vehicles << new_vehicle
        end
        vehicles
    end
end