class Solution {
  void sortColors(List<int> nums) {
    // z: 0, o: 1, t: 2
    int z = 0, o = 0, t = nums.length - 1;
    while (o <= t){
      if (nums[o] == 1) {
        o++;
      } else if (nums[o] == 0){
        nums[o] = nums[z];
        nums[z] = 0;
        z++;
        o++;
      } else {
        nums[o] = nums[t];
        nums[t] = 2;
        t--;
      }
      // print('z: $z, o: $o, t: $t, nums: $nums');
    }
  }
}