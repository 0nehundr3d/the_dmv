require './lib/facility_factory'
require './lib/dmv_data_service'
require './lib/facility'
require 'pry'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
    end

    describe "initialize" do
        it "exists" do
            expect(@factory).to be_a(FacilityFactory)
        end
    end

    describe "create_facilities" do
        it "can create facilities with the co dataset" do
            facilities = @factory.create_facilities(DmvDataService.new.co_dmv_office_locations)
            
            expect(facilities[0]).to be_a(Facility)
            expect(facilities[0].name).to eq("DMV Tremont Branch")
            expect(facilities[0].address).to eq("2855 Tremont Place Suite 118")
            expect(facilities[0].phone).to eq("(720) 865-4600")
            expect(facilities[0].services).to eq(["Vehicle Titles", "Registration", "Renewals", "Vin Inspections"])
        end

        it "can create facilities with the ny dataset" do
            facilities = @factory.create_facilities(DmvDataService.new.ny_dmv_office_locations)
            
            expect(facilities[0]).to be_a(Facility)
            expect(facilities[0].name).to eq("LAKE PLACID COUNTY OFFICE")
            expect(facilities[0].address).to eq("2693 MAIN STREET")
            expect(facilities[0].phone).to eq(nil)
            expect(facilities[0].services).to eq([])
        end

        it "can create facilities with the mo dataset" do
            facilities = @factory.create_facilities(DmvDataService.new.mo_dmv_office_locations)
            
            expect(facilities[0]).to be_a(Facility)
            expect(facilities[0].name).to eq("Harrisonville")
            expect(facilities[0].address).to eq("2009 Plaza Dr.")
            expect(facilities[0].phone).to eq("(816) 884-4133")
            expect(facilities[0].services).to eq([])
        end
    end
end