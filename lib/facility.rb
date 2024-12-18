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

  def administer_written_test(registrant)
    return false if !services.include?("Written Test")
    return false if !registrant.permit?
    return false if registrant.age < 16

    registrant.update_license_data(:written)
    true
  end

  def administer_road_test(registrant)
    return false if !services.include?("Road Test")
    return false if !registrant.license_data[:written]

    registrant.update_license_data(:license)
    true
  end

  def renew_drivers_license(registrant)
    return false if !services.include?("Renew License")
    return false if !registrant.license_data[:license]

    registrant.update_license_data(:renewed)
    true
  end
end
