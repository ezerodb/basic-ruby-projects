to_sort = [3,7,6,1,9,5]

def bubble_sort(array)
    len = array.length
    for i in 0...len - 1
        for i in 0...len - 1
            curr = array[i]
            nex = array[i + 1]
            if curr > nex
                array[i + 1] = curr
                array[i] = nex
            end
        end
        len -= 1
    end
    array
end

p bubble_sort(to_sort)