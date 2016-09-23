def windowed_max_range(arr, window)
  #O(nlog(n)) => O(3n) => O(n**2) when half sized
  current_max_range = nil
  arr[0...arr.length - window].each do |idx|
    val = arr[idx...idx + window].max - arr[idx...idx + window].min
    if current_max_range.nil? || val > current_max_range
      current_max_range = val
    end
  end
end



class MyStack

  attr_reader :max, :min

  def initialize(values = [])
    @stack = values
  end

  def pop
    @stack.pop
  end

  def push(n)
    @stack.push(n)
  end

  def peek
    @stack.last
  end

  def size
    @stack.size
  end

  def empty?
    @stack == []
  end
end

class MyQueue
  def initialize(values = [])
    @queue = values
  end

  def dequeue
    @queue.shift
  end

  def enqueue(n)
    @queue.push(n)
  end

  def peek
    @queue.first
  end

  def size
    @queue.size
  end

  def empty?
    @queue == []
  end

end

class StackQueue
  def initialize(list = [])
    @stack_queue_1 = MyStack.new(list)
    @stack_queue_2 = MyStack.new([])
  end

  def enqueue(n)
    stack = find_full
    stack.push(n)
  end

  def dequeue
    empty = find_empty
    full = find_full

    full.size.times do
      empty.push(full.pop)
    end

    empty.pop

    empty.size.times do
      full.push(empty.pop)
    end
  end

  def find_empty
    @stack_queue_1.empty? ? @stack_queue_1 : @stack_queue_2
  end

  def find_full
     @stack_queue_1.empty? ? @stack_queue_2 : @stack_queue_1
  end

  def max
    find_full.max
  end

  def min
    find_full.min
  end

  def empty?
    @stack_queue_1.empty? && @stack_queue_2.empty?
  end

  def size
    @stack_queue_1.size && @stack_queue_2.size
  end
end

class MinMaxStackQueue
  def initialize
    @stack_queue_full = MyStack.new()
    @stack_queue_empty = MyStack.new()
  end

  def enqueue(n)
    min, max = get_min_max(n)
    @stack_queue_full.push({n => {max: max, min: min}})
  end

  def dequeue
    @stack_queue_full.size.times do
      @stack_queue_empty.push(@stack_queue_full.pop)
    end

    @stack_queue_empty.pop

    @stack_queue_empty.size.times do
      enqueue(@stack_queue_empty.pop.keys.first)
    end
  end

  def peek
    @stack_queue_full.peek.values.first
  end

  def empty?
    @stack_queue_full.empty?
  end

  def get_min_max(n)
    if empty?
      max, min = n, n
    else
      last_value = peek
      max = last_value[:max]
      min = last_value[:min]

      if n > max
        max = n
      elsif n < min
        min = n
      end
    end

    [min, max]
  end
end

def windowed_max_range_adt(list,w)
  sq = MinMaxStackQueue.new

  w.times do
    sq.enqueue(list.shift)
  end

  max_val = sq.peek[:max] - sq.peek[:min]

  until list.empty?
    sq.dequeue
    sq.enqueue(list.shift)
    local = sq.peek[:max] - sq.peek[:min]
    if local > max_val
      max_val = local
    end
  end

    max_val
end
