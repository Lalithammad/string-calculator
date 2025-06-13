class StringCalculator
    def add(input)
        #no value present then return 0
        return 0 if input.empty?
        #filter_out all values from delimeters and provide fresh array with integers only
        numbers = input.scan(/-?\d+/).map(&:to_i)
        #raise if number is negative and show them into error message all negative digits.
        negatives = numbers.select{|n| n<0 }
        raise "negatives not allowed: #{negatives.join(',')}" if negatives.any?
        #ignore numbers > 1000 and return sum
        numbers.reject{|n| n>1000}.sum
    end
end