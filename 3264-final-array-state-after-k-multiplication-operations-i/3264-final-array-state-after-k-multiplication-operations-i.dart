class Solution {
  final mod = 1000000007;
  List<int> getFinalState(List<int> nums, int k, int multiplier) {
    
    // (mod cnt, number, index)
    final pq = PriorityQueue<(int, int, int)>((a, b) {
      final (am, an, ai) = a;
      final (bm, bn, bi) = b;
      if (am != bm) return am.compareTo(bm);
      if (an != bn) return an.compareTo(bn);
      return ai.compareTo(bi);
    });
    
    for (int i = 0; i < nums.length; i++){
      pq.add((nums[i] ~/ mod, nums[i] % mod, i));
    }

    for (int i = 0; i < k; i++){
      var (mods, n, idx) = pq.remove();
      n *= multiplier;
      pq.add((mods + n ~/ mod, n % mod, idx));
    }
    while (!pq.isEmpty){
      final (_, n, idx) = pq.remove();
      nums[idx] = n;
    }
    return nums;
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
	bool get isNotEmpty => !_elements.isEmpty; 
	bool get isEmpty => _elements.isEmpty; 
	
	int get length => _elements.length; 
	
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