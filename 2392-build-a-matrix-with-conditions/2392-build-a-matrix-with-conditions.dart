import 'dart:collection';
class Solution {
  List<List<int>> buildMatrix(int k, List<List<int>> RC, List<List<int>> CC) {
    final res = List.generate(k, (_) => List.filled(k, 0));
    // 진입점 카운트
    final rowInto = List.filled(k + 1, 0);
    final colInto = List.filled(k + 1, 0);
    // 간선 to map
    final rowEdges = <int, List<int>>{};
    final colEdges = <int, List<int>>{};
    for (final row in RC){
      rowInto[row[1]]++;
      rowEdges[row[0]] ??= [];
      // if (rowEdges.containsKey(row[1]) && rowEdges[row[1]]!.contains(row[0])) return [];
      rowEdges[row[0]]!.add(row[1]);
    }
    for (final col in CC){
      colInto[col[1]]++;
      colEdges[col[0]] ??= [];
      // if (colEdges.containsKey(col[1]) && colEdges[col[1]]!.contains(col[0])) return [];
      colEdges[col[0]]!.add(col[1]);
    }

    // column을 위상정렬로 상대순서대로 정리
    final rq = PriorityQueue<int>((a, b) => a.compareTo(b));
    final cq = PriorityQueue<int>((a, b) => a.compareTo(b));
    
    for (int i = 1; i <= k; i++){
      if (rowInto[i] == 0) rq.add(i);
      if (colInto[i] == 0) cq.add(i);
    }

    // print('rq.size: ${rq.size}, cq.size: ${cq.size}');
    // if (rq.size == 0 || cq.size == 0) return [];
    final colOrder = List.filled(k + 1, 0);
    for (int i = 1; i <= k; i++){
      if (cq.isEmpty) break;
      final cur = cq.remove();
      colOrder[cur] = i;
      final edge = colEdges[cur] ?? [];
      for (final e in edge){
        colInto[e]--;
        if (colInto[e] == 0){
          cq.add(e);
        }
      }
    }
    // print(colInto);
    // print(colOrder);
    if (colInto.any((a) => a > 0)) return [];
    // row 위상 순서에 맞춰 column의 위상에 따라 배치
    for (int i = 0; i < k; i++){
      if (rq.isEmpty) break;
      final cur = rq.remove();
      res[i][colOrder[cur] - 1] = cur;
      final edge = rowEdges[cur] ?? [];
      for (final e in edge){
        rowInto[e]--;
        if (rowInto[e] == 0){
          rq.add(e);
        }
      }
    }
    // print(rowInto);
    if (rowInto.any((a) => a > 0)) return [];
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