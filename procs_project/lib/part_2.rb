def reverser(str, &prc)
    return prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    words= sentence.split(" ")
    new_sentence=[]
    words.each do |word|
        new_sentence<< prc.call(word)
    end
    return new_sentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    outcome_1 = prc1.call(num)
    outcome_2 = prc2.call(num)
    if outcome_1 >= outcome_2
        return outcome_1
    end
    outcome_2
end

def and_selector(arr, prc1, prc2)
    new_array=[]
    arr.each do |el|
        new_array<< el if prc1.call(el) ==true && prc2.call(el)== true
    end
    new_array
end

def alternating_mapper (arr, prc1, prc2)
    new_array=[]
    arr.each.with_index do |el,i|
        if i%2==0
            new_array<< prc1.call(el)
        elsif i%2==1
            new_array<< prc2.call(el)
        end
    end
    new_array
end
