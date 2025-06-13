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
    context "handles newline as delimiters" do
        it "return 3 for string '//;\n1;2'" do
            expect(calc.add("//;\n1;2")).to eq(3)
        end
        it "return 6 for string '//[***]\n1@@2##3'" do 
            expect(calc.add("//[***]\n1@@2##3")).to eq(6)  
        end
        it "return 6 for string '//[*][%]\n1@2(3)'" do
            expect(calc.add("//[*][%]\n1@2(3)")).to eq(6)
        end
    end
    context "handle negative numbers" do
        it "return error for negative numbers for string '1,-2,-3'" do 
            expect{ calc.add('1,-2,-3') }.to raise_error("negatives not allowed: -2,-3")
        end
        it "return error for negative numbers for string '1,--2,--3'" do 
            expect{ calc.add('1,--2,--3') }.to raise_error("negatives not allowed: -2,-3")
        end
        it "return error for negative numbers for string '-3'" do 
            expect{ calc.add('-3') }.to raise_error("negatives not allowed: -3")
        end
    end
    context "ignore number over 1000" do
        it "return 2 for string '2,1001'" do
            expect(calc.add('2,1001')).to eq(2)
        end 
        it "return 6 for string '2,1001,4,1234'" do
            expect(calc.add('2,1001,4,1234')).to eq(6)
        end
    end
end