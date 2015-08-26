class Node
  attr_accessor :data, :next

  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_reader :head

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def index_at(position)
    current = head
    position.times{ current = current.next }
    current.nil? ? nil : current.data
  end

  def insert_at_index(position, data)
    current = head
    current.next = Node.new(nil, nil) if current.next.nil?
    position.times do
      current = current.next
      current.next = Node.new(nil, nil) if current.next.nil?
    end
    current.next.data = current.data
    current.data = data
  end

  def unshift(new_data)
    insert_at_index(0, new_data)
  end

  def push(new_data)
    current = head
    while !current.next.nil? do
      current = current.next
    end
    current.data = new_data
  end
end
