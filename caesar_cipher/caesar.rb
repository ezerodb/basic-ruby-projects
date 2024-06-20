def is_char?(char)
    /\A[a-zA-Z]+\z/.match?(char)
end

def caesar(char, num)

    # ord -> unicode | chr -> character
    alph = 25
    
    unless is_char?(char) || is_char?(char) || is_char?(char)
        return char
    else
        if char =~ /[a-z]/
            const = 'a'
            uni_val = char.ord - const.ord
            caesar_val = uni_val + num
            if caesar_val > alph
                while caesar_val > alph do
                    caesar_val -= 26
                end
                return (caesar_val + const.ord).chr
            end
            return (caesar_val + const.ord).chr
        elsif char =~ /[A-Z]/
            const = 'A'
            uni_val = char.ord - const.ord
            caesar_val = uni_val + num
            if caesar_val > alph
                while caesar_val > alph do
                    caesar_val -= 26
                end
                return (caesar_val + const.ord).chr
            end
            return (caesar_val + const.ord).chr
        end
    end
end

to_cipher = gets.chomp
key = gets.chomp.to_i

arr = to_cipher.split("")

cipher_arr = []

arr.each do | c |
    char = caesar(c, key)
    cipher_arr.push(char)
end

puts cipher_arr.join