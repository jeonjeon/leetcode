import 'dart:math';
class Solution {
  List<int> smallestSubarrays(List<int> nums) {
    final res = <int>[];
    final suffix = List.generate(nums.length + 1, (_) => List.filled(32, 0));
    for (int i = nums.length - 1; i >= 0; i--){
        final n = nums[i];
        for (int j = 0; j < 32; j++){
            suffix[i][j] = suffix[i + 1][j];
            if (n & (1 << j) > 0) suffix[i][j]++;
        }
    }
    for (int i = 0; i < suffix.length - 1; i++){
        int l = i, r = suffix.length - 1;
        final cur = suffix[i];
        if (cur.every((c) => c == 0)){
            res.add(1);
            continue;
        }
        while (l < r){
            final m = (l + r) ~/ 2;
            if (bs(cur, suffix[m])){
                r = m;
            } else {
                l = m + 1;
            }
        }
        res.add(l - i);
    }
    return res;
  }
  bool bs(List<int> cur, List<int> diff){
    for (int i = 0; i < 32; i++){
        if (cur[i] == 0) continue;
        if (cur[i] == diff[i]) return false;
    }
    return true;
  }

}