require 'spec_helper'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "register_vehicle" do
    it "can register a vehicle" do
      @facility.add_service("Vehicle Registration")

      expect(@facility.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility.collected_fees).to eq(100)

      expect(@facility.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      expect(@facility.collected_fees).to eq(125)

      expect(@facility.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      expect(@facility.collected_fees).to eq(325)

      expect(@facility.registered_vehicles).to eq([@cruz, @camaro, @bolt])

    end

    it "can not register a vehicle without the appropirate service" do
      expect(@facility.register_vehicle(@bolt)).to eq(nil)
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end
end
