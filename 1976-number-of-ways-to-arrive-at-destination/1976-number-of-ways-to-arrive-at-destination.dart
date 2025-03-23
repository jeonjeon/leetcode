class Solution {
  int countPaths(int n, List<List<int>> roads) {
    if (n < 3) return 1;
    final mod = 1000000007;
    // edges {start: {end, time}}
    final edge = <int, List<(int, int)>>{};
    for (final [v1, v2, t] in roads){
      (edge[v1] ??= []).add((v2, t));
      (edge[v2] ??= []).add((v1, t));
    }

    // time
    final time = List.filled(n, 1000000000);
    time[0] = 0;
    // ways
    final way = List.filled(n, 0);
    way[0] = 1;

    // priority queue for djikstra (start, end, time)
    final pq = PriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    for (final (cur, t) in edge[0]!){
      pq.add((0, cur, t));
    }
    // go djikstra
    while (pq.isNotEmpty){
      final (prev, cur, t) = pq.remove();
      if (time[cur] < t) continue;
      if (time[cur] == t){
        way[cur] = (way[cur] + way[prev]) % mod;
        continue;
      } 
      // t < time[cur]
      time[cur] = t;
      way[cur] = way[prev];
      // print('prev: $prev, cur: $cur, t: $t time: $time, way: $way');
      for (final (next, nt) in (edge[cur]!)){
        final tt = t + nt;
        if (time[next] < tt) continue;
        pq.add((cur, next, tt));
      }
    }
    // print('time: $time, way: $way');
    return way.last % mod;
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