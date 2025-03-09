class Solution {
  int numberOfAlternatingGroups(List<int> colors, int k) {
    final l = colors.length;
    int cnt = 0, res = 0;
    for (int i = 0; i < l + k - 2; i++){
      if (colors[i % l] != colors[(i + 1) % l]){
        cnt = cnt == 0 ? 2 : (cnt + 1);
      } else {
        cnt = 0;
      }
      if (cnt >= k) res++;
      // print('i: $i, cnt: $cnt, res: $res');
    }
    return res;
  }
}