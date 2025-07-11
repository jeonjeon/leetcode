import 'dart:math';
class Solution {
  int mostBooked(int n, List<List<int>> meet) {
    meet.sort((a, b) => a.first.compareTo(b.first));
    // <(room, end time)>
    final use = PriorityQueue<(int, int)>((a, b) {
        if (a.$2 == b.$2) return a.$1.compareTo(b.$1);
        return a.$2.compareTo(b.$2);
    });
    // room
    final empty = PriorityQueue<int>((a, b) => a.compareTo(b));
    List.generate(n, empty.add);
    final cnt = List.filled(n, 0);
    for (var [s, e] in meet){
        while (use.isNotEmpty && use.first.$2 <= s){
            final (room, et) = use.remove();
            empty.add(room);
        }
        if (empty.isNotEmpty){
            final room = empty.remove();
            use.add((room, e));
            cnt[room]++;
            continue;
        } 
        final (room, et) = use.remove();
        use.add((room, max(et, s) + (e - s)));
        cnt[room]++;
    }
    return cnt.indexed.reduce((a, b) => a.$2 < b.$2 ? b : a).$1;
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
	T get last { 
		if (isEmpty) throw StateError('empty'); 
		return _elements.last; 
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