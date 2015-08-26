require 'pry'
require_relative '../simple-lists/simple_linked_list'

class Element
  attr_accessor :datum, :next, :previous

  def initialize(data, next_node)
    @datum = data
    @next = next_node
    next_node.previous = self unless next_node.nil?
  end

  def next=(next_node)
    @next = next_node
    next_node.previous = self if !next_node.nil? && next_node.previous != self
  end

  def previous=(previous_node)
    @previous = previous_node
    previous_node.next = self if !previous_node.nil? && previous_node.next != self
  end


end

class Deque
  attr_accessor :list, :last


  def push(data)
    if self.list.nil?
      self.list = Element.new(data, nil)
      self.last = self.list
    else
      current = list
      while !current.next.nil?
        current = current.next
      end
      current.next = Element.new(data, nil)
      self.last = current.next
    end

  end

  def pop
    value = self.last.datum
    self.last = self.last.previous
    self.last.next = nil unless self.last.nil?
    value
  end

  def shift
    value = self.list.datum
    self.list = self.list.next
    value
  end

  def unshift(data)
    if self.list.nil?
      self.list = Element.new(data, nil)
      self.last = self.list
    else
      self.list.previous = Element.new(data, self.list)
      self.list = self.list.previous
      self.last = self.list.next
    end
  end

end
