class Solution {
  int countInterestingSubarrays(List<int> nums, int mod, int k) {
    int res = 0;
    int cnt = 0;
    final hm = <int, int>{};

    for (int i = 0; i < nums.length; i++){
      // count n mod == k
      if (nums[i] % mod == k){
        cnt = (cnt + 1) % mod;
      }
      int pc = cnt - k;
      if (pc < 0) pc += mod;
      res += hm[pc] ?? 0;
      if (cnt == k) res++;
      //print('cnt: $cnt, pc: $pc, hm: $hm');
      hm[cnt] = (hm[cnt] ?? 0) + 1;
    }
    //print(hm);
    return res;
  }
}