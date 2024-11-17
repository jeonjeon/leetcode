import 'dart:math';
import 'dart:collection';
class Solution {
  int shortestSubarray(List<int> nums, int k) {
    final n = nums.length;
    int res = n + 1;
    final q = Queue<int>();
    final prefix = [0];
    nums.forEach((nm) => prefix.add(prefix.last + nm));
    // print(prefix);
    for (int i = 0; i < prefix.length; i++){
        while (q.isNotEmpty && prefix[i] - prefix[q.first] >= k){
            res = min(res, i - q.removeFirst());
        }
        while (q.isNotEmpty && prefix[i] <= prefix[q.last]){
            q.removeLast();
        }
        q.add(i);

    }
    // print(res);
    if (res > n) return -1;
    return res;
  }
}