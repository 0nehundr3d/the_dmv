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
    return if !@services.include?("Vehicle Registration")
    
    vehicle.register
    
    case vehicle.plate_type
    when :regular
      @collected_fees += 100
    when :antique
      @collected_fees += 25
    when :ev
      @collected_fees += 200
    end

    @registered_vehicles << vehicle
  end
end
