class Solution {
  int minMaxDifference(int num) {
    final arr = <int>[];
    while (num > 0){
        arr.add(num % 10);
        num ~/= 10;
    }
    final nums = arr.reversed.toList();
    final not9 = nums.firstWhere((n) => n < 9, orElse: () => -1);
    final not0 = nums.firstWhere((n) => n > 0, orElse: () => -1);
    int mx = 0, mn = 0;
    for (int i = 0; i < nums.length; i++){
        mx *= 10;
        mn *= 10;
        mx += (nums[i] == not9 ? 9 : nums[i]);
        mn += (nums[i] == not0 ? 0 : nums[i]);
    }
    return mx - mn;
  }
}