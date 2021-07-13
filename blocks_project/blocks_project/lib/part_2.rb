def all_words_capitalized?(words)

    words.all? {|word| word.capitalize== word}

end

def no_valid_url?(urls)
    valids= [".com", ".net", ".io", ".org"]

    urls.none? do |url|
        valids.any? {|ending| url.end_with?(ending)}
    end
end

def any_passing_students?(students)
    students.any? {|student| student[:grades].sum/student[:grades].length>=75}
end
