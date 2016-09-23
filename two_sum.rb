def bad_two_sum?(arr,tar) #O(n**2)
  (0...arr.length-1).each do |start|
    (start + 1...arr.length).each do |finish|
      return true if arr[start] + arr[finish] == tar
    end
  end
  false
end

def bsearch(arr,tar)
  return nil if arr.empty?

  m = arr.length / 2

  case arr[m] <=> tar
  when 0
    return m
  when -1
    idx = bsearch(arr.drop(m+1),tar)
    return nil if idx.nil?
    m + 1 + idx
  when 1
    bsearch(arr.take(m),tar)
  end
end


def ok_two_sum(arr,tar)
  arr.sort! # n log n
  arr.each_with_index do |el, idx| # n
    return true if bsearch(arr[idx + 1..-1], tar - el) #log n
  end

  false
end



def good_two_sum?(arr, tar)
  results = Hash.new(false)
  arr.each do |el|
    return true if results[el]
    results[tar - el] = true
  end

  false
end

def good_four_sum?(arr, tar)

end
