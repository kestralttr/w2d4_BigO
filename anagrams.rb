def anagram_1(str_1, str_2)
  #O(n!)
  list_of_word = str_1.chars.permutation.to_a.map(&:join)
  return list_of_word.include?(str_2)
end

def anagram_2(str_1, str_2)
  #O(n**2)
  idx = 0
  while idx < str_1.length #O(n)
    found_letter = str_2.index(str_1[idx]) #O(n)
    if found_letter.nil?
      idx += 1
    else
      str_1 = str_1[1..-1]
      str_2 = str_2.chars.tap { |list| list.delete_at(found_letter) }.join #O(n)
    end
  end

  return str_1.empty? && str_2.empty?
end

def anagram_3(str_1, str_2)
  str_1.sort! #O(n log n)
  str_2.sort! #0(n log n)
  return str_1 == str_2
end #0(n log n)

def anagram_4(str_1, str_2)

  str_1_hash = Hash.new(0)
  str_1.chars.each do |letter| #0(n)
    str_1_hash[letter] += 1
  end
  str_2_hash = Hash.new(0)
  str_2.chars.each do |letter| #0(n)
    str_2_hash[letter] += 1
  end

  str_1_hash == str_2_hash #0(2n)
end #0(n)
