class Solution {
  int findLucky(List<int> arr) {
    final feq = List.filled(501, 0);
    arr.forEach((a) => feq[a]++);
    return feq.indexed
              .skip(1)
              .lastWhere((a) => a.$1 == a.$2, orElse: () => (-1, -1)).$1;
  }
}