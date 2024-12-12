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

        it "has license date" do
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end
end