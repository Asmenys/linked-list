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

  def size(head = @head)
    result = 0
    if head.next_node.nil?
      1
    else
      result = size(head.next_node)
      result += 1
      result
    end
  end

  def tail(head = @head)
    if head.next_node.nil?
      head
    else
      tail(head.next_node)
    end
  end

  def at(index, current_index = 0, head = @head)
    if current_index == index
      head
    else
      at(index, current_index += 1, head.next_node)
    end
  end

  def pop(head = @head)
    if head.next_node.next_node.nil?
      head.next_node = nil
    else
      pop(head.next_node)
    end
  end

  def contains?(value, head = @head)
    if head.value == value
      true
    elsif head.next_node.nil?
      false
    else
      contains?(value, head.next_node)
    end
  end

  def find(value, head = @head)
    return nil if contains?(value) == false

    result = 0
    if head.value == value
      0
    else
      result = find(value, head.next_node)
      result += 1
      result
    end
  end

  def to_s(head = @head)
    result = ''
    if head.next_node.nil?
      head.value
    else
      result += head.value
      result += ' -> '
      result += to_s(head.next_node)
      result
    end
  end
end

# node class
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
tlist = LinkedList.new('head')
binding.pry
text = 'text'
