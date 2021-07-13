
def range(start, ending)
    return [] if  ending <start
    if ending == start
        return [start]
    end
    return [start] + range(start+1, ending)
end

def it_sum(array)
    array.inject{|sum, el| sum+el}
end

def rec_sum(array)
    return array.first if array.length<=1
    return array.first + rec_sum(array[1..-1])
end

def exp1(base, exponent)
    if exponent==0
        return 1
    end
    return base *exp1(base, exponent-1)
end

def exp2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    even_case= exp2(base, exponent/2)
    even_case *= even_case

    odd_case = exp2(base, (exponent-1)/2)
    odd_case = base * odd_case * odd_case

    if exponent.even?
        return even_case
    else
        return odd_case
    end
end

def deep_copy(arr)
    new_arr =[]
    arr.each do |el|
        if el.is_a?(Array)
            new_arr << deep_copy(el)
        else
            new_arr << el
        end
    end
    return new_arr
end

def rec_fibonacci(n)
    if n <= 2
        [0,1].take(n)
    else
        fibs = rec_fibonacci(n-1)
        fibs << fibs[-2] + fibs[-1]
    end
end

def binary_search(array, target)
    return nil if array.empty?

    length= array.length
    middle= length/2
    p array[middle]

    if array[middle] == target
        return middle
        byebug
    elsif target < array[middle]
        return binary_search(array.take(middle), target)
    elsif target > array[middle]
        subs_ans= binary_search(array.drop(middle+1), target)
        subs_ans.nil? ? nil : middle + subs_ans + 1
    end
end

def merge(left, right)
    merged_array =[]

    until left.empty? || right.empty?
        merged_array << (left.first < right.first) ? left.shift : right.shift
    end
    merged_array + left + right
end





def merge_sort(array)
    merged_array=[]
    return array if array.length<=1

    arr1= array.take(array.length/2)
    arr2= array.drop(array.length/2)

    sorted_left = merge_sort(arr1)
    sorted_right = merge_sort(arr2)

    merge(sorted_left, sorted_right)
end
