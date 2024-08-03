import 'dart:math';
import 'dart:collection';
class Solution {
  final sett = <int>{};
  bool canPartitionKSubsets(List<int> nums, int k) {
    final sum = nums.reduce((a, b) => a + b);
    if (sum % k > 0) return false;
    final div = sum ~/ k;
    if (nums.any((n) => n > div)) return false;
    final total = pow(2, nums.length) - 1;
    // print('total: $total');
    final arr = <int>[];
    for (int i = 1; i <= total; i++){
      int cur = 0;
      for (int j = 0; j < nums.length; j++){
        if ((1 << j) & i > 0){
          cur += nums[j];
        }
        if (cur > div) break;
      }
      if (cur == div) arr.add(i);
    }
    // print(arr.reduce((a, b) => a | b));
    final q = Queue<int>.from(arr);
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      if (cur == total) return true;
      for (final n in arr){
        if(cur & n == 0){
          q.add(cur | n);
        }
      }
    }
    return false;
  }
}