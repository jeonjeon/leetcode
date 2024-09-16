class Solution {
  int MAX = 24 * 60;
  int findMinDifference(List<String> tp) {
    int res = MAX;
    final arr = tp.map((t) => t.split(':'))
                  .map((ta) => int.parse(ta[0]) * 60 + int.parse(ta[1]))
                  .toList();
    arr.sort();
    for (int i = 1; i < arr.length; i++){
      res = min(res, arr[i] - arr[i - 1]);
    }
    return min(res, arr.first + MAX - arr.last);
  }
}