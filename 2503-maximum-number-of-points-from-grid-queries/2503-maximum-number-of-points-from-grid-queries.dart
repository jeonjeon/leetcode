import 'dart:math';
class Solution {
  List<int> maxPoints(List<List<int>> grid, List<int> qr) {
    final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
    final arr = List.filled(1000001, 0);
    // prev max, y, x
    final pq = PriorityQueue<(int, int, int)>((a, b) => a.$1.compareTo(b.$1))
              ..add((0, 0, 0));
    while (pq.isNotEmpty){
        final (prevMax, y, x) = pq.remove();
        if (grid[y][x] == 0) continue;
        final curMax = max(prevMax, grid[y][x]);
        grid[y][x] = 0;
        arr[curMax]++;
        for (final (dy, dx) in dir){
            final ny = y + dy;
            final nx = x + dx;
            if (ny < 0 || ny >= grid.length) continue;
            if (nx < 0 || nx >= grid[0].length) continue;
            if (grid[ny][nx] == 0) continue;
            // print('ny: $ny, nx: $nx');
            pq.add((curMax, ny, nx));
        }
    }
    for (int i = 1; i < 1000001; i++){
        arr[i] += arr[i - 1];
    }
    // print(arr);
    return qr.map((n) => arr[n - 1]).toList();
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