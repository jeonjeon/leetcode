class Solution {
  int closestTarget(List<String> w, String t, int s) {
    final n = w.length;
    for (int i = 0; i < n; i++){
      if (w[(s + i) % n] == t) return i;
      if (w[(s - i + n) % n] == t) return i;
    }
    return -1;
  }
}