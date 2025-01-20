class Solution {
  int firstCompleteIndex(List<int> arr, List<List<int>> mat) {
    final m = mat.length, n = mat[0].length;
    final col = List.filled(n, 0);
    final row = List.filled(m, 0);
    final idxs = List.generate(arr.length + 1, (_) => (0, 0));
    for (int r = 0; r < m; r++){
        for (int c = 0; c < n; c++){
            idxs[mat[r][c]] = (r, c);
        }
    }
    for (int i = 0; i < arr.length; i++){
        final (r, c) = idxs[arr[i]];
        if (++row[r] == n) return i;
        if (++col[c] == m) return i;
    }
    return 0;
  }
}