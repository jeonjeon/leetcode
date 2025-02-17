class Solution {
  int numTilePossibilities(String tiles) {
    final a = 'A'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < tiles.length; i++){
        arr[tiles.codeUnitAt(i) - a]++;
    }
    return dfs(arr) - 1;
  }
  int dfs(List<int> arr){
    int res = 1;
    for (int i = 0; i < arr.length; i++){
        if (arr[i] == 0) continue;
        arr[i]--;
        res += dfs(arr);
        arr[i]++;
    }
    return res;
  }
}