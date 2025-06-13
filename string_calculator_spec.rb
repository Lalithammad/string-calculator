require_relative "string_calculator"
require "rspec"

RSpec.describe StringCalculator do 
    let(:calc){StringCalculator.new}
    it "returns 0 for an empty string" do 
        expect(calc.add("")).to eq(0)
    end
    context "single number" do  
        it "returns 1 for a string '1'" do 
            expect(calc.add("1")).to eq(1)
        end
        it "returns 3 for a string '3'" do 
            expect(calc.add("3")).to eq(3)
        end
    end
    context "duble digit numbers" do 
        it "return 4 for string '1,3'" do 
            expect(calc.add("1,3")).to eq(4)
        end

        it "return 10 for string '7,3'" do 
            expect(calc.add("7,3")).to eq(10)
        end
    end
    context "three digit numbers" do 
        it "return 7 for string '1,2,4'" do 
            expect(calc.add("1,2,4")).to eq(7)
        end

        it "return 12 for string '7,3,2'" do 
            expect(calc.add("7,3,2")).to eq(12)
        end
    end
end