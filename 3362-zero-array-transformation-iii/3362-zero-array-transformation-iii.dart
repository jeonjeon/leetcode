class Solution {
  int maxRemoval(List<int> nums, List<List<int>> queries) {
    final nl = nums.length, ql = queries.length;
    final pq1 = PriorityQueue<List<int>>((a, b) => a.first.compareTo(b.first));
    final pq2 = PriorityQueue<List<int>>((a, b) => b.last.compareTo(a.last));
    queries.forEach((q) => pq1.add(q));

    final dec = List.filled(nl + 1, 0);
    int used = 0, cur = 0, di;
    for (int i = 0; i < nl; i++){
      cur += dec[i];
      // 가능한 옮겨 담기
      while (pq1.isNotEmpty && pq1.first.first <= i){
        pq2.add(pq1.remove());
      }
      // 현재값 커버 가능할 때 까지 cur 올리기
      while (pq2.isNotEmpty && cur < nums[i]){
        final [s, e] = pq2.remove();
        if (e < i) continue;
        used++;
        cur++;
        dec[e + 1]--;
      }
      if (cur < nums[i]) return -1;
    }
    return ql - used;
  }
}

class PriorityQueue<T> { 
	List<T> _elements = []; 
	Comparator<T> _comparator; 
	PriorityQueue(this._comparator); 
	
	bool get isNotEmpty => !_elements.isEmpty; 
	bool get isEmpty => _elements.isEmpty; 
	int get length => _elements.length; 
	
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