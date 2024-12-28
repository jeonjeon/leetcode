import 'dart:math';
class Solution {
  int maxScoreSightseeingPair(List<int> values) {
    int res = 0;
    int prev = -1;
    for (final v in values){
        if (prev == -1) {
            prev = v;
            continue;
        }
        res = max(res, v + prev - 1);
        prev = max(v, prev - 1);
    }
    return res;
  }
}