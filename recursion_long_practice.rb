# @RETURN Array<integer>
def range(start, end_num)
    if end_num < start
        return []
    end
    [start] + range(start+1, end_num)
    # range(1,5)
    #   [1] + range(2,5)
    #   [2] + range(3,5)
    #   [3] + range(4,5)
    #   [4] + range(5,5)
    #   [5] + []  (range(6,5))
    #   [4,5]
    #   [3,4,5]
    #   [2,3,4,5]
    #   [1,2,3,4,5]
end

# puts range(1,5)

def exp_v1(base, exp)
    return 1 if exp == 0
    base * exp_v1(base, exp-1) 
end

puts exp_v1(2, 6)

def exp_v2(base, exp)
    return 1 if exp == 0
    return base if exp == 1
    if exp.even?
        result = exp_v2(base, exp/2)
        return result * result
    end
    result = exp_v2(base, (exp-1)/2)
    return base * (result*result)
end

puts exp_v2(2, 6)