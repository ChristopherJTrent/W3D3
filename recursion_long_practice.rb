require "byebug"
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

#puts exp_v1(2, 6)

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

#puts exp_v2(2, 6)

# string* mechanical = ["nuts", "bolts" , "washers"]
# string* electrical = ["capacitors", "resistors", "inductors"]
# robot parts = [mechanical, electrical]
# robot_parts_copy = robot_parts.shallow_copy
# robot_parts_copy[1] << "LEDs"
# electrical << "LEDs"

class Array 
    def deep_dup
        result = []
        self.each do |ele|
            if ele.is_a?(Array)
                result << ele.deep_dup
            else
                result << ele
            end
        end
        result
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts.each {|e| puts e.object_id}
# copy = robot_parts.deep_dup
# copy.each {|e| puts e.object_id}

# recursive
def fibonacci_v1(n)
    return [] if n <= 0
    if n == 1 
        return [1]
    elsif n == 2
        return [1,1]
    else 
        temp = fibonacci_v1(n-1)
        # longer, slower way to write 83 (O(n^3))
        # fibonacci_v1(n-1) << fibonacci_v1(n-1)[-1] + fibonacci_v1(n-1)[-2]
        # shorter, faster way to write, (O(n))
        temp << (temp[-1] + temp[-2])
    end
end

# p fibonacci_v1(7)

# iterative fibonacci

def fibonacci_v2(n)
    return [] if n == 0
    return [1] if n == 1
    result = [1, 1]
    (2...n).each { result << result[-1] + result[-2]}
    result    
end

# p fibonacci_v2(7)

# p fibonacci_v1(5) == fibonacci_v2(5)

def bsearch(search_space, target, offset=0)
    # debugger
    return 0 if search_space.length == 1 && search_space[0] == target
    return nil if search_space.length <= 1
    middle = search_space.length / 2  # could commonly be called "pivot" in search algorithms

    return middle + offset if search_space[middle] == target
    if target > search_space[middle]
        return bsearch(search_space[(middle)..], target, middle + offset)
        # middle = 2 [5]
    else
        return bsearch(search_space[0...middle], target)
    end

end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
# [1,3]  [5,9]
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# 6 elements, returning index 2 instead of index 5 
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
