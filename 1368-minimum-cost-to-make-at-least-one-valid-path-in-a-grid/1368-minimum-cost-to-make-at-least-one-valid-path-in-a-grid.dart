class Solution {
  int minCost(List<List<int>> grid) {
    final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
    final m = grid.length, n = grid[0].length;
    final res = List.generate(m, (_) => List.filled(n, 10001));
    // (cost, (y, x))
    final pq = PriorityQueue<(int, (int, int))>((a, b) => a.$1.compareTo(b.$1));
    pq.add((0, (0, 0)));
    res[0][0] = 0;
    while (pq.isNotEmpty){
        final (cost, (y, x)) = pq.remove();
        if (res[y][x] < cost) continue;
        for (int i = 0; i < 4; i++){
            var nc = cost;
            if (grid[y][x] != i + 1) nc++;
            final (dy, dx) = dir[i];
            final ny = y + dy;
            final nx = x + dx;
            if (ny < 0 || ny >= m) continue;
            if (nx < 0 || nx >= n) continue;
            if (res[ny][nx] <= nc) continue;

            // can move
            res[ny][nx] = nc;
            pq.add((nc, (ny, nx)));
        }
    }
    // print(res);
    return res.last.last;
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