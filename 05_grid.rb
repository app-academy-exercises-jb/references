# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

def grid(n, m)
    #Array.new(n, Array.new(m, nil))    #<--- why does this not work? the initial array is created correctly, but inner assignment duplicates itself
                                        #because the array's subarrays refer to the same object! 

    #array = []                          #long way of doing it right
    #n.times { array << Array.new(m) }   #this one creates a new nil Array of m length, appended n times
    #array

    Array.new(n) { Array.new (m) }      #this is the appropriate shorthand
end

result_1 = grid(2, 3)
p result_1              # => [[nil, nil, nil], [nil, nil, nil]]
result_1[0][0] = "X"
p result_1              # => [["X", nil, nil], [nil, nil, nil]]


result_2 = grid(4, 2)
p result_2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
result_2[0][0] = "Q"
p result_2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]
