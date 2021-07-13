def my_map(arr, &prc)
    new_array=[]
    arr.each do |n|
        new_array <<prc.call(n)
    end
    new_array
end

def my_select(arr, &prc)
    new_array=[]
    arr.each do |n|
        new_array<< n if prc.call(n)== true
    end
    new_array
end

def my_count(arr, &prc)
    count=0
    arr.each do |n|
        count+=1 if prc.call(n)==true
    end
    count
end

def my_any?(arr, &prc)
    arr.each do |n|
        return true if prc.call(n)==true
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |n|
        return false if prc.call(n)==false
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |n|
        return false if prc.call(n)==true
    end
    true
end
