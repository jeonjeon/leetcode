import 'dart:math';
import 'dart:collection';
class Solution {
  final sett = <int>{};
  bool canPartitionKSubsets(List<int> nums, int k) {
    final totalSum = nums.reduce((a, b) => a + b);
    // if sum can not be divided by k return false
    if (totalSum % k > 0) return false;
    final partitionSum = totalSum ~/ k;
    final mask = (pow(2, nums.length) - 1).toInt();
    final partitions = List.generate(mask + 1, (i) => i)
                           .where((i) => canPartitionSum(i, partitionSum, nums))
                           .toList();
    final q = Queue<int>.from(partitions);
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      if (cur == mask) return true;
      for (final n in partitions){
        if(cur & n == 0) q.add(cur | n);
      }
    }
    return false;
  }

  bool canPartitionSum(int number, int remains, List<int> nums){
    for (int i = 0; i < nums.length; i++){
      if ((1 << i) & number > 0) remains -= nums[i];
      if (remains < 0) return false;
    }
    return remains == 0;
  }
}