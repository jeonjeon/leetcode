class Solution {
  bool checkValidCuts(int n, List<List<int>> rect) {
    final hori = <(int, int)>[];
    final vert = <(int, int)>[];
    for (final [l, b, r, t] in rect){
      hori.add((l, 1));
      hori.add((r, -1));
      vert.add((b, 1));
      vert.add((t, -1));
    }
    hori.sort((a, b) {
      if (a.$1 == b.$1) return a.$2.compareTo(b.$2);
      return a.$1.compareTo(b.$1);
    });
    vert.sort((a, b) {
      if (a.$1 == b.$1) return a.$2.compareTo(b.$2);
      return a.$1.compareTo(b.$1);
    });
    return check(hori) || check(vert);
  }
  bool check(List<(int, int)> arr){
    int rect = 0, res = 0;
    for (final (_, op) in arr){
      rect += op;
      if (rect == 0) res++;
    }
    return res > 2;
  }
}