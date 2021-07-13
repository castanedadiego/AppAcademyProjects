

def sum_to(n)
    return nil if n<1
    return 1 if n==1
        return n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nil if nums_array.length==0
    if nums_array.length ==1
        return nums_array.first
    end
    return nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n<1
    return 1 if n<=2
    return (n-1)*gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    return nil if flavors.length<= 0
    p flavors.first
    if flavors.first == favorite
        return true
    end
    return ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
    return string[0] if string.length<=1
    return reverse(string[1..-1]) + string[0]
end

def quicksort(array)
    return array if array.length<=1

    pivot= array.first
    less_than_set= array.drop(1).select {|el| el<pivot}
    more_than_set= array.drop(1).select {|el| el>=pivot}

    return quicksort(less_than_set) + [pivot] + quicksort(more_than_set)
end
