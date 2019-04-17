require './lib/method' #=> add this
require 'rspec'

class Array
  include Enumerable
end

describe Enumerable do
  describe '#my_each' do
    it 'returns the values of each the modified element of an array or hash' do
      expect((1..5).to_a.my_each { |s| puts s }).to eql((1..5).to_a.each { |s| puts s })
    end
  end

  describe '#my_map' do
    it 'returns a new array with each value modified' do
      expect((1..5).to_a.my_map { |s| s * 2 }).to eql((1..5).to_a.map { |s| s * 2 })
    end
  end

  describe '#my_select' do
    it 'returns a new array with values that meets the condition' do
      expect((1..5).to_a.my_select { |s| s < 1 }).to eql((1..5).to_a.select { |s| s < 1 })
    end
  end

  describe '#my_all?' do
    it 'returns true if all elements meets the condition' do
      expect((1..5).to_a.my_all? { |s| s < 1 }).to eql((1..5).to_a.all? { |s| s < 1 })
    end
  end

  describe '#my_none?' do
    it 'returns true if no element meets the condition' do
      expect((1..5).to_a.my_none? { |s| s == 0 }).to eql((1..5).to_a.none? { |s| s == 0 })
    end
  end

  describe '#my_count' do
    it 'returns the number of elements that meets the condition' do
      expect((1..5).to_a.my_count { |s| s > 3 }).to eql((1..5).to_a.count { |s| s > 3 })
    end
  end
end
