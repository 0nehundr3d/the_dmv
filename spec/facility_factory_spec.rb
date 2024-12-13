require './lib/facility_factory'

RSpec.describe FacilityFactory do
    before(:each) do
        @factory = FacilityFactory.new
    end

    describe "initialize" do
        it "exists" do
            expect(@factory).to be_a(FacilityFactory)
        end
    end
end