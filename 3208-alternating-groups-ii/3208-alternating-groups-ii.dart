class Solution {
  int numberOfAlternatingGroups(List<int> colors, int k) {
    final l = colors.length;
    int cnt = 0, res = 0;
    // from last to (last + (k - 1))
    // last = colors.length - 1
    // so then i < (l - 1) + (k - 1)
    for (int i = 0; i < l + k - 2; i++){
      if (colors[i % l] != colors[(i + 1) % l]){
        cnt = cnt == 0 ? 2 : (cnt + 1);
      } else {
        // 만약 인접한 두 색이 같지 않다면 cnt는 0이된다
        // 왜냐하면 alternating group은 연속적이어야 하기 때문에
        cnt = 0;
      }
      if (cnt >= k) res++;
    }
    return res;
  }
}