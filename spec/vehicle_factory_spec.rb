require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
    end

    describe "initialize" do
        it 'exists' do
            expect(@factory).to be_a(VehicleFactory)
        end
    end

    describe "create_vehicles" do
        it "can create vehicles" do
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            vehicles = @factory.create_vehicles(wa_ev_registrations)

            expect(vehicles[0]).to be_a(Vehicle)
            expect(vehicles[0].engine).to eq(:ev)
            expect(vehicles[0].make).to eq("BMW")
            expect(vehicles[0].model).to eq("i3")
            expect(vehicles[0].vin).to eq("WBY8P8C51K")
            expect(vehicles[0].year).to eq("2019")
        end
    end
end