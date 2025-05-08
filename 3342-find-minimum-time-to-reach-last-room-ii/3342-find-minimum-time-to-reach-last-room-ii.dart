class Solution {
  int minTimeToReach(List<List<int>> mt) {
    final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
    final n = mt.length, m = mt[0].length;
    final dp = List.generate(n, (_) => List.filled(m, 2000000000));
    dp[0][0] = 0;
    var pq = PriorityQueue<(int, int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    pq.add((0, 0, 0, 1));

    while (pq.isNotEmpty){
        final (y, x, time, step) = pq.remove();
        if (dp[y][x] < time) continue;
        for (final (dy, dx) in dir){
            final ny = y + dy, nx = x + dx;
            if (ny < 0 || ny >= n) continue;
            if (nx < 0 || nx >= m) continue;
            final nTime = max(mt[ny][nx], time) + step;
            if (dp[ny][nx] <= nTime) continue;
            dp[ny][nx] = nTime;
            pq.add((ny, nx, nTime, step == 1 ? 2 : 1));
        }
    }
    return dp.last.last;
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