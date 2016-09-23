require 'byebug'
class Array
  #[3,5,2,6,8,4]
  def my_min_n_2
    min = nil
    self.each_index do |id1|
      local_min = nil
      self.each_index do |id2|
        next if id1 == id2
        case self[id1] <=> self[id2]
        when  -1
          val = self[id1]
        else
          val = self[id2]
        end
        if local_min.nil? || local_min > val
          local_min = val
        end
      end
      if min.nil? || min > local_min
        min = local_min
      end
    end
    min
  end

  def my_min
    min = nil

    self.each_index do |idx|
      if min.nil? || min > self[idx]
        min = self[idx]
      end
    end
    min
  end
end


p [ 0, 3, 5, 4, -5, 10, 1, 90 ].my_min

  # [2,4,6,8]

def largest_contiguous_subsum(list)
  new_list = subsets(list)
  max = nil

  new_list.each do |subs|
    local_max= subs.inject(:+)
    if max.nil? || max < local_max
      max = local_max
    end
  end

  max
end

def subsets(list)
  new_list = []
  list.each_index do |id1|
    (id1...list.length).each do |id2|
      new_list << list[id1..id2]
    end
  end

  new_list
end

def lcs(list)
  #debugger
  max = nil
  idx = 0
  local_max = 0
  while idx < list.length
    if local_max + list[idx] > local_max
      local_max += list[idx]
    elsif local_max + list[idx] < 1
      local_max = 0
    end
    idx += 1
    if max.nil? || local_max > max
      max = local_max
    end
  end
  max
end

p lcs([5,3,-7])
