class Solution {
  List<int>? res;

  List<int> constructDistancedSequence(int n) {
    res = null;
    final arr = List.filled(n * 2 - 1, 0);
    final visited = List.filled(n + 1, false);
    _dfs(0, arr, visited, n);
    return res!;
  }

  bool _dfs(int index, List<int> arr, List<bool> visited, int n) {
    if (index == arr.length) {
      res = List<int>.from(arr);
      return true;
    }
    
    if (arr[index] != 0) {
      return _dfs(index + 1, arr, visited, n);
    }

    for (int i = n; i >= 1; i--) {
      if (visited[i]) continue;
      visited[i] = true;
      arr[index] = i;

      if (i == 1) {
        if (_dfs(index + 1, arr, visited, n)) return true;
      } else if (index + i < arr.length && arr[index + i] == 0) {
        arr[index + i] = i;
        if (_dfs(index + 1, arr, visited, n)) return true;
        arr[index + i] = 0; // 백트래킹
      }

      arr[index] = 0; // 백트래킹
      visited[i] = false;
    }

    return false;
  }
}
