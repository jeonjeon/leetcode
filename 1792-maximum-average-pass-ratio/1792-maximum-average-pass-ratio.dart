class Solution {
  double maxAverageRatio(List<List<int>> cl, int e) {
    var rateSum = 0.0;
    final pq = PriorityQueue<List<int>>((a, b) {
        if ((a[0] + 1) / (a[1] + 1) - (a[0] / a[1]) > (b[0] + 1) / (b[1] + 1) - (b[0] / b[1])){
            return -1;
        }
        return 1;
    });
    cl.forEach(pq.add);
    for (int _ = 0; _ < e; _++){
        final c = pq.remove();
        c[0]++;
        c[1]++;
        pq.add(c);
    }
    while (pq.isNotEmpty){
        final c = pq.remove();
        // print(c);
        rateSum += c[0] / c[1];
    }
    return rateSum / cl.length;
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