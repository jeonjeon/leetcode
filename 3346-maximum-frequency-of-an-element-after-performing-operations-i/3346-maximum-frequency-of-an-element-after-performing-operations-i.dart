import 'dart:math';
class Solution {
  int maxFrequency(List<int> nums, int k, int op) {
    int res = 0;
    final arr = List.filled(100001, 0);
    for (final n in nums) arr[n]++;
    for (int i = 1; i < arr.length; i++){
        arr[i] += arr[i - 1];
    }
    for (int i = 1; i < arr.length; i++){
        final l = max(0, i - k - 1);
        final r = min(arr.length - 1, i + k);
        res = max(res, min(arr[i] - arr[i - 1] + op, arr[r] - arr[l]));
        // print('i: $i, l: $l, r: $r, res: $res, arr[i]: ${arr[i]}, op: $op');
    }
    return res;
  }
}