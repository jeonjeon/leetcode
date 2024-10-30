import 'dart:math';
class Solution {
  int minimumMountainRemovals(List<int> nums) {
    final len = nums.length;
    int mountain = 0;
    final l = List.filled(len, 0);
    final r = List.filled(len, 0);
    // left
    for (int i = 0; i < len; i++){
        for (int j = 0; j < i; j++){
            if (nums[j] < nums[i]){
                l[i] = max(l[i], l[j] + 1);
            }
        }
    }
    // right
    for (int i = len - 1; i >= 0; i--){
        for (int j = len - 1; j > i; j--){
            if (nums[j] < nums[i]){
                r[i] = max(r[i], r[j] + 1);
            }
        }
    }
    // check maximum mountain
    for (int i = 0; i < len; i++){
        if (l[i] != 0 && r[i] != 0){
            mountain = max(mountain, r[i] + l[i] + 1);
        }
    }
    print('l: $l');
    print('r: $r');
    print('res: ${len - mountain}');
    return len - mountain;
  }
}