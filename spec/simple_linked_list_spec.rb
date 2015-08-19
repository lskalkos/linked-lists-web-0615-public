require 'pry'
describe Node do 
  let(:node) { Node.new(1, next_node)}
  

  describe '#next' do 
    context 'when the node points to a next node' do
      let(:next_node) { Node.new(2, last_node) }
      let(:last_node) { Node.new(2, nil) }

      it 'returns that node' do
        expect(node.next).to eq(next_node)
      end

      it 'returns the next nodes next node' do 
        expect(node.next.next).to eq(last_node)
      end
    end

    context 'when the does not point to a next node' do
      let(:next_node) { Node.new(2, last_node) }
      let(:last_node) { Node.new(2, nil) }

      it 'returns nil' do
        expect(node.next.next.next).to eq(nil)
      end
    end
  end
end

describe LinkedList do
  describe '#head' do 
    let(:linked_list) { LinkedList.new(data)}
    let(:data) { 1 }

    context 'when the linked list has initial data' do
      it 'points to a node, which contains the first data' do 
        expect(linked_list.head.data).to eq data
      end
    end
  end

  describe '#index_at' do 
    let(:linked_list) { LinkedList.new(data)}
    let(:data) { 1 }

    context 'when the linked list has data pointing to that index' do
      it 'returns the data at the provided index' do 
        expect(linked_list.index_at(0)).to eq 1
      end
    end

    context 'when the linked list does not have data pointing to that index' do
      it 'returns nil' do 
        expect(linked_list.index_at(1)).to eq nil
      end
    end
  end

  describe '#insert_at_index' do 
    let(:linked_list) { LinkedList.new(data)}
    let(:data) { 2 }
    
    it 'inserts the data at the specified index' do 
      linked_list.insert_at_index(1, 10)
      expect(linked_list.index_at(1)).to eq 10
    end

    it 'moves the data at the modified index one index down' do 
      linked_list.insert_at_index(1, 8)
      linked_list.insert_at_index(1, 10)
      expect(linked_list.index_at(2)).to eq 8
    end

    context 'when insert at an index beyond the last element' do 
      let(:linked_list) { LinkedList.new(data)}
      let(:data) { 2 }

      it 'returns nil values for the missing elements' do 
        linked_list.insert_at_index(4, 4)
        expect(linked_list.index_at(1)).to eq nil
        expect(linked_list.index_at(2)).to eq nil
        expect(linked_list.index_at(3)).to eq nil
        expect(linked_list.index_at(4)).to eq 4
      end
    end
  end

  describe '#unshift' do 
    let(:linked_list) { LinkedList.new(data)}
    let(:data) { 1 }
    let(:new_data) { 2 }

    before do 
      linked_list.unshift(new_data)
    end

    it 'moves the unshifted node to the beginning of the linked list' do    
      expect(linked_list.index_at(0)).to eq new_data
    end

    it 'has the previous head node as the second element in the list' do 
      expect(linked_list.index_at(0)).to eq new_data
      expect(linked_list.index_at(1)).to eq data
    end
  end

  describe '#push' do 
    let(:linked_list) { LinkedList.new(1)}
    let(:new_data) { 5 }
    before do 
      linked_list.insert_at_index(1, 3)
      linked_list.insert_at_index(2, 8)
    end

    it 'moves the pushed data to the end of the list' do 
      linked_list.push(new_data)
      expect(linked_list.index_at(3)).to eq new_data
    end
  end
end