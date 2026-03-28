class Solution {
  String findTheString(List<List<int>> lcp) {
    int n = lcp.length, c = 0;
    List<int> A = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      if (A[i] > 0) continue;
      if (++c > 26) return "";
      for (int j = i; j < n; j++) {
        if (lcp[i][j] > 0) A[j] = c;
      }
    }

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        int v = (i + 1 < n && j + 1 < n) ? lcp[i + 1][j + 1] : 0;
        v = A[i] == A[j] ? v + 1 : 0;
        if (lcp[i][j] != v) return "";
      }
    }

    StringBuffer res = StringBuffer();
    for (int a in A) {
      res.writeCharCode('a'.codeUnitAt(0) + a - 1);
    }
    return res.toString();
  }
}