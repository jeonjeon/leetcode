import 'dart:math';
class Solution {
  final maxx = 10000000001;
  int minimumWeight(int n, List<List<int>> edges, int src1, int src2, int dest) {
    //1. 거리 2d array로 재구성
    final edg = <int, Map<int, int>>{};
    final rev = <int, Map<int, int>>{};
    for (final e in edges){
      edg[e[0]] ??= {};
      rev[e[1]] ??= {};
      edg[e[0]]![e[1]] = min(edg[e[0]]![e[1]] ?? e[2], e[2]);
      rev[e[1]]![e[0]] = min(rev[e[1]]![e[0]] ?? e[2], e[2]);
    } 
    //print(rev);
    final s1 = getDist(src1, edg, n);
    final s2 = getDist(src2, edg, n);
    final d = getDist(dest, rev, n);
    print('s1: $s1, s2: $s2, d: $d');
    int res = maxx;
    for (int i = 0; i < n; i++){
      res = min(res, s1[i] + s2[i] + d[i]);
    }
    if (res > maxx - 1) return -1;
    return res;
  }
  
  
  List<int> getDist(int s, Map<int, Map<int, int>> edg, int n){
    final arr = List.filled(n, maxx);
    arr[s] = 0;
    final pq = PriorityQueue<(int, int)>((a, b) => a.$1.compareTo(b.$1));
    pq.add((0, s));
    while (!pq.isEmpty){
      final (w, cur) = pq.remove();
      if (!edg.containsKey(cur)) continue;
      final next = edg[cur]!;
      for(final key in next.keys){
        if(w + next[key]! < arr[key]){
          arr[key] = w + next[key]!;
          pq.add((arr[key], key));
        }
      }
    }
    return arr;
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
	
	bool get isEmpty => _elements.isEmpty; 
	
	int get size => _elements.length; 
	
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