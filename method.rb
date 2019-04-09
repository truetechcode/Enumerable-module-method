module Enumerable
# my_each
  def my_each
    i = 0
    while i < self.size
      if self.is_a? Array
        yield(self[i]) if block_given?
      else 
        yield(self.to_a[i]) if block_given?
      end
        i+=1      
    end
      self if !block_given?
  end

# my_each_with_index
  def my_each_with_index
    i = 0
    while i < self.size
      if self.is_a? Array
        yield(self[i],i) if block_given?
      else 
        yield(self.to_a[i],i) if block_given?
      end
        i+=1      
    end
      self if !block_given?
  end

# my_select
  def my_select
    new_array = []
    i = 0
    while i < self.size
      if self.is_a? Array
        new_array.push(self[i]) if yield(self[i])
      else 
        new_array.push(self.to_a[i]) if yield(self.to_a[i])
      end
        i+=1      
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
        i+=1      
    end
  end

 # my_any?
  def my_any?
    i = 0
    while i < self.size
      if block_given?
        if self.is_a? Array
          if yield(self[i])
            return true 
          else
            return false
          end
        else
          if yield(self.to_a[i])
            return true 
          else
            return false
          end
        end
      else
        return true
      end
        i+=1      
    end
  end
end
# (1..10).to_a.my_none? {|i| i==10}