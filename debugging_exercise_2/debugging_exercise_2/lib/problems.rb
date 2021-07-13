# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def largest_prime_factor(n)
    num= n
    while n>=0
        if num%n==0 && prime?(n)
        return n
        end
        n=n-1
    end
end

def unique_chars?(str)
    chars= Hash.new(0)
    str.each_char do |char|
        chars[char]+=1
    end
    if chars.any? {|key, value| value>1 }
        return false
    end
true
end

def dupe_indices(arr)
    indices= Hash.new{ |h,k| h[k]=[] }
    arr.each_with_index do |el,i|
        indices[el].push(i)
    end
indices.select { |k,v| v.length >= 2 }
end

def ana_array(arr_1, arr_2)
    counts1, counts2= Hash.new(0), Hash.new(0)
    arr_1.each do |el|
    counts1[el]+=1
    end

    arr_2.each do |el|
    counts2[el]+=1
    end

    return false if counts1!=counts2

    true
end
