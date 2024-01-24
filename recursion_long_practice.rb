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

print range(1,5)