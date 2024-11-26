class Solution {
  int findChampion(int n, List<List<int>> edges) {
    int res = -1;
    final arr = List.filled(n, 0);
    for (final e in edges){
        arr[e[1]]++;
    }
    for (int i = 0; i < arr.length; i++){
        if (arr[i] == 0){
            if (res == - 1){
                res = i;
            } else {
                return -1;
            }
        }
    }
    return res;
  }
}