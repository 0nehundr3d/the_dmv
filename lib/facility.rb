class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(info_hash)
    @name = info_hash[:name]
    @address = info_hash[:address]
    @phone = info_hash[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
