import 'dart:math';
class Solution {
  int minimumDifference(List<int> nums) {
    final n = nums.length ~/ 3;

    final prefix = List.filled(nums.length, 0);
    final minQ = PriorityQueue<int>((a, b) => b.compareTo(a));
    int sum = 0;
    for (int i = 0; i < nums.length - n; i++){
        minQ.add(nums[i]);
        sum += nums[i];
        if (minQ.length > n) sum -= minQ.remove();
        prefix[i] = sum;
    }
    final suffix = List.filled(nums.length, 0);
    final maxQ = PriorityQueue<int>((a, b) => a.compareTo(b));
    sum = 0;
    for (int i = nums.length - 1; i >= n; i--){
        maxQ.add(nums[i]);
        sum += nums[i];
        if (maxQ.length > n) sum -= maxQ.remove();
        suffix[i] = sum;
    }
    int res = 10000000000;
    for (int i = n; i < nums.length - n + 1; i++){
        res = min(res, prefix[i - 1] - suffix[i]);
    }
    return res;
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