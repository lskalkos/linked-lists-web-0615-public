require_relative 'spec_helper'
require_relative '../deque/deque'
require_relative '../simple-lists/simple_linked_list'

describe Element do
  let(:one) {Element.new(1, nil)}
  let(:two) {Element.new(2, nil)}
  let(:three) {Element.new(3, nil)}

  it 'has a writeable next attribute' do
    one.next = two
    expect(one.next).to eq(two)
  end

  it 'has a writeable previous attribute' do
    one.previous = two
    expect(one.previous).to eq(two)
  end

  it "sets up next and previous automatically when either is set" do
    #setting next should set previous on next element
    one.next = two
    expect(one.previous).to eq(nil)
    expect(two.previous).to eq(one)
    expect(two.next).to eq(nil)

    #setting previous should set next on previous element
    three.previous = two
    expect(two.next).to eq(three)
    expect(three.previous.previous).to eq(one)
  end

  it "sets previous on initialize" do
    new_element = Element.new(2, one)
    expect(new_element.next).to eq(one)
    expect(one.previous).to eq(new_element)
  end

end

describe Deque do

  it 'is initialized with a list attribute' do
    deque = Deque.new
    expect(deque.list).to eq(nil)
  end

  it 'can push and pop' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.list.datum).to eq(10)
    expect(deque.pop()).to eq(20)
    expect(deque.list.datum).to eq(10)
    expect(deque.pop()).to eq(10)
  end

  it 'can push and shift' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.list.datum).to eq(10)
    expect(deque.shift()).to eq(10) 
    expect(deque.list.datum).to eq(20)
    expect(deque.shift()).to eq(20) 
  end

  it 'can shift and unshift' do
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    deque.unshift(30)
    expect(deque.list.datum).to eq(30)
    expect(deque.shift).to eq(30)
    expect(deque.shift()).to  eq(20)
    expect(deque.list.datum).to eq(10)    
    expect(deque.shift()).to  eq(10)

  end

  it 'can unshift and pop' do
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    expect(deque.list.datum).to eq(20)
    expect(deque.pop()).to eq(10)
    expect(deque.list.datum).to eq(20)
    expect(deque.pop()).to eq(20)
  end

  it 'works with a full example' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.pop()).to eq(20)
    deque.push(30)
    expect(deque.shift()).to eq(10)
    deque.unshift(40)
    deque.push(50)
    expect(deque.shift()).to eq(40)
    expect(deque.pop()).to eq(50)
    expect(deque.shift()).to eq(30)
  end

  it 'uses Element under the hood' do
    deque = Deque.new
    expect(deque.list).to eq(nil)
    deque.push(10)
    expect(deque.list.datum).to eq(10)
    expect(deque.list.next).to eq(nil)
    deque.unshift(20)
    expect(deque.list.datum).to eq(20)
    expect(deque.list.next.datum).to eq(10)
  end

end