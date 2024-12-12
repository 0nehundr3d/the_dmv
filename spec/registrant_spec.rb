require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    describe "Initialize" do
        it "exists" do
            expect(@registrant_1).to be_a(Registrant)
        end
    end

    describe "Initialze methods" do
        it "has a name" do
            expect(@registrant_1.name).to eq("Bruce")
            expect(@registrant_2.name).to eq("Penny")
        end

        it "has an age" do
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_2.age).to eq(15)
        end


        it "has license data" do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe "permit?" do
        it "returns status of registrant permit" do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end

    describe "earn_permit" do
        it "can earn a permit" do
            @registrant_2.earn_permit

            expect(@registrant_2.permit?).to eq(true)
        end
    end

    describe "update_license_data" do
        it "can update license data" do
            @registrant_1.update_license_data(:written)
            @registrant_1.update_license_data(:license)
            @registrant_1.update_license_data(:renewed)

            expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
        end
    end
end