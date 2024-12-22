import 'dart:math';
class Solution {
  List<int> leftmostBuildingQueries(List<int> h, List<List<int>> q) {
    final res = List.filled(q.length, -1);
    // pq: (left, right, idx)
    final pq = PriorityQueue<(int, int, int)>((a, b) => a.$2.compareTo(b.$2));
    for (int i = 0; i < q.length; i++){
        final ai = q[i][0], bi = q[i][1];
        pq.add((min(ai, bi), max(ai, bi), i));
    }
    // pq2: (max height, idx)
    final pq2 = PriorityQueue<(int, int)>((a, b) => a.$1.compareTo(b.$1));
    for (int i = 0 ; i < h.length; i++){
        while (!pq.isEmpty && i >= pq.first.$2) {
            final (li, ri, idx) = pq.remove();
            // 둘다 같은 위치 시작
            if (li == ri){
                res[idx] = ri;
            // 오른쪽 친구 고정
            } else if (h[ri] > h[li]){
                res[idx] = ri;
            // 둘 다 움직여야함
            } else {
                // print('li: $li, ri: ')
                pq2.add((max(h[ri], h[li]), idx));
            }
        }
        while(!pq2.isEmpty && pq2.first.$1 < h[i]){
            final (_, index) = pq2.remove();
            res[index] = i;
        }
    }
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