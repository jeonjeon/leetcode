import 'dart:math';
class Solution {
  double maxProbability(int n, List<List<int>> edges, List<double> succProb, int s, int e) {
    final probs = List.filled(n, .0);
    probs[s] = 1;
    final hm = <int, List<(int, double)>>{};
    final q = PriorityQueue<(int, double)>((a, b) => b.$2.compareTo(a.$2))..add((s, 1));
    for (int i = 0; i < edges.length; i++){
      final e = edges[i];
      final p = succProb[i];
      (hm[e[0]] ??= []).add((e[1], p));
      (hm[e[1]] ??= []).add((e[0], p));
    }
    while(!q.isEmpty){
      final (cur, p) = q.remove();
      final nexts = hm[cur] ?? [];
      for (final (next, np) in nexts){
        if (probs[next] >= p * np) continue;
        probs[next] = p * np;
        q.add((next, p * np));
      }
    }
    // print(probs);
    return probs[e];
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