# Adding my own methods onto the existing Enumerable module.
module Enumerable
  # my_each
  def my_each
    i = 0
    while i < self.size
      if self.is_a?(Array) && block_given?
        yield(self[i])
      elsif block_given?
        yield(self.to_a[i])
      end
      i += 1
    end
    self unless block_given?
  end

  # my_each_with_index
  def my_each_with_index
    i = 0
    while i < self.size
      if self.is_a?(Array) && block_given?
        yield(self[i], i)
      elsif block_given?
        yield(self.to_a[i], i)
      end
      i += 1
    end
    self unless block_given?
  end

  # my_select
  def my_select
    new_array = []
    i = 0
    while i < self.size
      if self.is_a?(Array) && yield(self[i])
        new_array.push(self[i])
      elsif yield(self[i])
        new_array.push(self.to_a[i])
      end
      i += 1
    end
    new_array
  end

  # my_all?
  def my_all?
    i = 0
    while i < self.size
      if block_given?
        if self.is_a? Array
          return yield(self[i]) ? true : false
        else
          return yield(self.to_a[i]) ? true : false
        end
      else
        return true
      end
      i += 1
    end
  end
end

# (1..10).to_a.my_none? {|i| i==10}