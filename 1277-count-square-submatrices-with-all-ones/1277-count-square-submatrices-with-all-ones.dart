class Solution {
  int countSquares(List<List<int>> m) {
    int res = 0;
    for (int i = 0; i < m.length; i++){
      for (int j = 0; j < m[0].length; j++){
        if (m[i][j] == 0) continue;
        if (i > 0 && j > 0){
          int mn = min(300, m[i - 1][j]);
          mn = min(mn, m[i][j - 1]);
          mn = min(mn, m[i - 1][j - 1]);
          m[i][j] += mn;
        }
        res += m[i][j];
      }
    }
    print(m);
    return res;
  }
}