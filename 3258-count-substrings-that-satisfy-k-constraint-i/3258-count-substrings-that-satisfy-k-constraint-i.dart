class Solution {
  int countKConstraintSubstrings(String s, int k) {
    final arr = s.split('');
    int res = 0, one = 0, zero = 0, l = 0;
    for (int r = 0; r < s.length; r++){
      if (s[r] == '0'){
        zero++;
      } else {
        one++;
      }
      while (l <= r && zero > k && one > k){
        if (s[l] == '0'){
          zero--;
        } else {
          one--;
        }
        l++;
      }
      res += r - l + 1;
    }
    return res;
  }

}