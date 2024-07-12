def is_char?(char)
  /\A[a-zA-Z]+\z/.match?(char)
end

def caesar(char, num)
  # ord -> unicode | chr -> character
  alph = 25

  return char unless is_char?(char) || is_char?(char) || is_char?(char)

  if char =~ /[a-z]/
    const = 'a'
    uni_val = char.ord - const.ord
    caesar_val = uni_val + num
    if caesar_val > alph
      caesar_val -= 26 while caesar_val > alph
      return (caesar_val + const.ord).chr
    end
    (caesar_val + const.ord).chr
  elsif char =~ /[A-Z]/
    const = 'A'
    uni_val = char.ord - const.ord
    caesar_val = uni_val + num
    if caesar_val > alph
      caesar_val -= 26 while caesar_val > alph
      return (caesar_val + const.ord).chr
    end
    (caesar_val + const.ord).chr
  end
end

to_cipher = gets.chomp
key = gets.chomp.to_i

arr = to_cipher.split('')

cipher_arr = []

arr.each do |c|
  char = caesar(c, key)
  cipher_arr.push(char)
end

puts cipher_arr.join
