class Solution {
  List<List<int>> restoreMatrix(List<int> rowSum, List<int> colSum) {
    final heap = PriorityQueue<(int, int)>((a, b) => b.$1.compareTo(a.$1));
    final res = List.generate(rowSum.length, (_) => List.filled(colSum.length, 0));
    for (int i = 0; i < colSum.length; i++) heap.add((colSum[i], i));
    for (int i = 0; i < rowSum.length; i++){
      var r = rowSum[i];
      while (r > 0){
        final (c, idx) = heap.remove();
        if (c > r){
          res[i][idx] = r;
          heap.add((c - r, idx));
          break;
        }
        res[i][idx] = c;
        r -= c;
      }
    }
    return res;
  }
}

class PriorityQueue<T> { 
	List<T> _elements = []; 
	Comparator<T> _comparator; 
	PriorityQueue(this._comparator); 
	
	void add(T element) { 
		_elements.add(element); 
		_bubbleUp(_elements.length - 1); 
	} 
	
	T remove() { 
		if (isEmpty) throw StateError("Cannot remove from empty priority queue."); 
		T result = _elements.first; 
		if (_elements.length == 1) { 
			_elements.removeLast(); 
		} else { 
			_elements[0] = _elements.removeLast(); 
			_bubbleDown(0); 
		} return result; 
	} 
		
	T get first { 
		if (isEmpty) throw StateError('empty'); 
		return _elements.first; 
	} 
	
	bool get isEmpty => _elements.isEmpty; 
	
	int get size => _elements.length; 
	
	void _bubbleUp(int index) { 
		while (index > 0) { 
			int parent = (index - 1) >> 1; 
			if (_comparator(_elements[index], _elements[parent]) >= 0) break; 
			_swap(index, parent); index = parent; 
		} 
	} 
	
	void _bubbleDown(int index) { 
		int leftChild; 
		int rightChild; 
		int minChild; 
		while (true) { 
			leftChild = (index << 1) + 1; 
			rightChild = leftChild + 1; 
			minChild = index; 
			if (leftChild < _elements.length && _comparator(_elements[leftChild], _elements[minChild]) < 0) { 
				minChild = leftChild; 
			} 
			if (rightChild < _elements.length && _comparator(_elements[rightChild], _elements[minChild]) < 0) { 
				minChild = rightChild; 
			} 
			if (minChild == index) break; 
			_swap(index, minChild); index = minChild; 
		}
	} 
	
	void _swap(int i, int j) { 
		T temp = _elements[i]; 
		_elements[i] = _elements[j]; 
		_elements[j] = temp; 
	} 
}