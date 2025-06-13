class StringCalculator
    def add(input)
        return 0 if input.empty?
        array_of_inputs = input.split(",").map{|x| x.to_i}
        sum = array_of_inputs.sum
    end
end