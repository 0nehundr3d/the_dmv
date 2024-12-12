class Facility
  attr_reader :name,
  :address,
  :phone,
  :services,
  :registered_vehicles

  def initialize(info_hash)
    @name = info_hash[:name]
    @address = info_hash[:address]
    @phone = info_hash[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end
