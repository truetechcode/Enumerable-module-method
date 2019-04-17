# Adding my own methods onto the existing Enumerable module.
module Enumerable
  # my_each
  def my_each
    i = 0
    result = []
    while i < size
      result << yield(self[i]) if block_given?
      i += 1
    end
    return self unless block_given?

    result
  end

  # my_each_with_index
  def my_each_with_index
    i = 0
    result = []
    while i < size
      result << yield(self[i], i) if block_given?
      i += 1
    end
    return self unless block_given?

    result
  end

  # my_select
  def my_select
    result = []
    i = 0
    while i < size
      result << self[i] if yield(self[i])
      i += 1
    end
    result
  end

  # my_all?
  def my_all?
    i = 0
    while i < size
      return yield(self[i]) ? true : false
      i += 1
    end
    true
  end

  # my_none?
  def my_none?
    i = 0
    while i < size
      return !include?(self[i]) if yield(self[i])

      i += 1
    end
    true
  end

  # my_count
  def my_count
    result = []
    each do |element|
      if block_given?
        result << yield(element) if yield(element)
      else
        result << self
      end
    end
    result.size
  end

  # my_map
  def my_map
    result = []
    each do |element|
      result << yield(element)
    end
    result
  end
end
