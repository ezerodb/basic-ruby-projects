dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(phrase, dic)
    matches = {}
    if phrase.include?(" ")
        phrase_array = phrase.split(" ")
        phrase_array.each do | wrd |
            word = wrd.downcase
            dic.each do | dic_wrd |
                dic_word = dic_wrd.downcase
                if word.include?(dic_word)
                    if matches[dic_word] == nil
                        matches[dic_word] = 1
                    else
                        matches[dic_word] += 1
                    end
                end
            end
        end
    else
        dic.each do | dic_word |
            if phrase.include?(dic_word)
                if matches[dic_word] == nil
                    matches[dic_word] = 1
                else
                    matches[dic_word] += 1
                end
            end
        end
    end
    matches
end

puts substring("below", dictionary)
puts substring("Howdy partner, sit down! How's it going?", dictionary)
