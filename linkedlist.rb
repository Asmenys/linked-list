# frozen_string_literal: true
require 'awesome_print'
require 'pry-byebug'

AwesomePrint.pry!

# linked list
class LinkedList
  attr_accessor :head

  def initialize(head_value)
    @head = Node.new(head_value)
  end

  def append(value, head = @head)
    if head.next_node.nil?
      head.next_node = Node.new(value)
    else
      append(value, head.next_node)
    end
  end

  def prepend(value)
    temp_next_node_pointer = head.next_node unless head.next_node.nil?
    @head.next_node = Node.new(value, temp_next_node_pointer)
  end
end

# node class 
class Node
  attr_accessor :value, :next_node

  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
tlist = LinkedList.new("head")
binding.pry
text = 'text'