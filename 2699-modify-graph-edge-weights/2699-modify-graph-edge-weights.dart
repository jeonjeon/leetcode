import 'dart:math';
class Solution {
  final maxx = 2000000000;
  List<List<int>> modifiedGraphEdges(int n, List<List<int>> edges, int source, int dest, int target) {
    final holes = <int>[];
    final grid = List.generate(n, (i) => <(int, int)>[]);
    for (int i = 0; i < edges.length; i++){
      final e = edges[i];
      if (e[2] == -1){
        holes.add(i);
        e[2] = maxx;
      }
      grid[e[0]].add((e[1], e[2]));
      grid[e[1]].add((e[0], e[2]));
    }
    var res1 = dijkstra(grid, source, dest);
    // print('res1: $res1');
    if (res1 < target) return [];
    if (res1 == target) return edges;
    for (final i in holes){
      final e = edges[i];
      e[2] = 1;
      grid[e[0]].add((e[1], e[2]));
      grid[e[1]].add((e[0], e[2]));
      final res = dijkstra(grid, source, dest);
      if (res <= target){
        // final diff = target - res;
        // print('target: $target, res: $res, diff: $diff');
        e[2] += target - res;
        // final test = dijkstra(grid, source, dest);
        // print('test: $test');
        return edges;
      }
    }
    return [];
  }
  int dijkstra(List<List<(int,int)>> grid, int source, int dest){
    final arr = List.filled(grid.length, maxx);
    final pq = PriorityQueue<(int, int)>((a, b) => a.$2.compareTo(b.$2))..add((source, 0));
    while (!pq.isEmpty){
      final (idx, weight) = pq.remove();
      if (arr[idx] <= weight) continue;
      arr[idx] = weight;
      for (final (ni, nw) in grid[idx]){
        if (arr[ni] > weight + nw) pq.add((ni, weight + nw));
      }
    }
    return arr[dest];
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