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
end