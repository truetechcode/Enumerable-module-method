require './lib/method' #=> add this
require 'rspec'

class Array
  include Enumerable
end

describe Enumerable do
    my_array = [1,2,3,4,5]
  describe '#my_each' do
    it 'returns the values of each the modified element of an array or hash' do
      expect(my_array.to_a.my_each { |s| s }).to eql(my_array.to_a.each { |s| s })
    end
  end

  describe '#my_map' do
    it 'returns a new array with each value modified' do
      expect(my_array.to_a.my_map { |s| s * 2 }).to eql(my_array.to_a.map { |s| s * 2 })
    end
  end

  describe '#my_select' do
    it 'returns a new array with values that meets the condition' do
      expect(my_array.to_a.my_select { |s| s < 1 }).to eql(my_array.to_a.select { |s| s < 1 })
    end
  end

  describe '#my_all?' do
    it 'returns true if all elements meets the condition' do
      expect(my_array.to_a.my_all? { |s| s < 1 }).to eql(my_array.to_a.all? { |s| s < 1 })
    end
  end

  describe '#my_none?' do
    it 'returns true if no element meets the condition' do
      expect(my_array.to_a.my_none? { |s| s == 0 }).to eql(my_array.to_a.none? { |s| s == 0 })
    end
  end

  describe '#my_count' do
    it 'returns the number of elements that meets the condition' do
      expect(my_array.to_a.my_count { |s| s > 3 }).to eql(my_array.to_a.count { |s| s > 3 })
    end
  end
end
