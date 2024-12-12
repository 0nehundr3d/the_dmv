class Facility
  attr_reader :name,
  :address,
  :phone,
  :services,
  :registered_vehicles,
  :collected_fees

  def initialize(info_hash)
    @name = info_hash[:name]
    @address = info_hash[:address]
    @phone = info_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.register
    @collected_fees += 100
    @registered_vehicles << vehicle
  end
end
