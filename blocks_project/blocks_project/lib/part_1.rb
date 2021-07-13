def select_even_nums(arr)
arr.select{|el| el%2==0}
end

def reject_puppies(dog_hashes)

dog_hashes.reject{|el| el["age"]<=2}

end

def count_positive_subarrays(arr)
    arr.count{|sub| sub.sum>0}
end

def aba_translate(str)
    newWord=""
    vowel="aeiou"

    str.each_char do |char|
        if vowel.include?(char.downcase)

            newWord<< char
            newWord<< "b"
            newWord<< char

        else
            newWord << char
        end
    end
    newWord
end

def aba_array(words)
    words.map{|word| aba_translate(word)}
end
