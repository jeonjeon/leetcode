class Solution {
  int minimumTime(List<List<int>> grid) {
    final dir = [(0, -1), (0, 1), (-1, 0), (1, 0)];
    final n = grid.length, m = grid[0].length;
    final dp = List.generate(n, (_) => List.filled(m, 10000000001));
    final pq = PriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    pq.add((0,0,0));
    while (!pq.isEmpty){
        final (y, x, t) = pq.remove();
        final canReach = dir.map((a) => (a.$1 + y, a.$2 + x))
                            .where((a) => !(a.$1 < 0 || a.$1 >= n || a.$2 < 0 || a.$2 >= m))
                            .where((a) => grid[a.$1][a.$2] <= t + 1)
                            .length;
        for (final (dy, dx) in dir){
            int ny = y + dy, nx = x + dx, nt = t + 1;
            if (ny < 0 || ny >= n || nx < 0 || nx >= m) continue;
            if (nt < grid[ny][nx]){
                if (canReach == 0) continue;
                int diff = grid[ny][nx] - nt;
                if (diff % 2 == 1) diff++;
                nt += diff;
            }
            if (dp[ny][nx] <= nt) continue;
            dp[ny][nx] = nt;
            pq.add((ny, nx, nt));
        }
    }
    final res = dp.last.last;
    if (res == 10000000001) return -1;
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