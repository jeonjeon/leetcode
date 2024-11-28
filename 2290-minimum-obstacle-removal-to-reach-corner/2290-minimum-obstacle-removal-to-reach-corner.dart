class Solution {
  final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
  int minimumObstacles(List<List<int>> grid) {
    final n = grid.length, m = grid[0].length, max = n * m;
    // print('n: $n, m: $m');
    final visit = List.generate(n, (_) => List.filled(m, max));
    final q = PriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    q.add((0, 0, grid[0][0]));
    while (q.isNotEmpty){
        // print(q);
        final (y, x, o) = q.remove();
        if (visit[y][x] <= o) continue;
        visit[y][x] = o;
        for (final (dy, dx) in dir){
            final ny = y + dy, nx = x + dx;
            if (ny < 0 || ny >= n || nx < 0 || nx >= m) continue;
            if (visit[ny][nx] <= o) continue;
            q.add((ny, nx, o + grid[ny][nx]));
        }
    }
    return visit.last.last;
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