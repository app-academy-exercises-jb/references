# Write a method, my_rotate!(array, amt), that accepts an array and a number as args.
# The method should mutate the array by rotating the elements 'amt' number of times. 
# When given a positive 'amt', a single rotation will rotate left, causing the first element to move to the last index
# When given a negative 'amt', a single rotation will rotate right, causing the last element to move to the first index
# The method should return the given array.
# Do not use the built-in Array#rotate
# 
# Note: this method must MUTATE the input array. This means that the object_id of the input array should be identical
# to the object_id of the returned array. The exact object_ids you get back don't matter. We just want the ids
# to be the same before and after calling your method.


def my_rotate!(array, amt)
    idx, nxt, temp = 0

    init = ->(i) {
        idx = i
        nxt = (idx+amt) % array.length
        temp = array[idx]
    }

    rotate = ->(tms) {
        (tms).times { |i|
            array[nxt], temp = temp, array[nxt]
            idx = nxt
            nxt = amt > 0 ? (nxt+amt) % array.length : (nxt-amt) % array.length
        }
    }

    init.call(0)

    if array.length % amt == 0
        rotate.call(array.length / amt)
        init.call(1)
        rotate.call(array.length / amt)
    else
        amt > 0 ? rotate.call(array.length) : rotate.call(array.length + 1)
    end

    array
end


array_1 = ["a", "b", "c", "d"]
p array_1.object_id                 # => 70354216023780
result_1 = my_rotate!(array_1, 2)
p result_1                          # => ["c", "d", "a", "b"]
p result_1.object_id                # => 70354216023780

array_2 = ["NOMAD", "SOHO", "TRIBECA"]
p array_2.object_id                 # => 70354216019660
result_2 = my_rotate!(array_2, 1)
p result_2                          # => ["SOHO", "TRIBECA", "NOMAD"]
p result_2.object_id                # => 70354216019660

array_3 = ["a", "b", "c", "d"]
p array_3.object_id                 # => 70354216016500
result_3 = my_rotate!(array_3, -3)
p result_3                          # => ["b", "c", "d", "a"]
p result_3.object_id                # => 70354216016500

array_4 = ["a", "b", "c", "d"]
p array_4.object_id                 # => 70354216016500
result_4 = my_rotate!(array_4, 3)
p result_4                          # => ["b", "c", "d", "a"]
p result_4.object_id                # => 70354216016500
