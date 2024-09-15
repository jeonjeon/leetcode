class Solution {
  int findTheLongestSubstring(String s) {
    final hm = {'a' : 0, 'e': 1, 'i' : 2, 'o': 3, 'u' : 4};
    final totalLen = 1 << 5;
    final arr = List.filled(totalLen, -1);
    int res = 0, cur = 0;
    for (int i = 0; i < s.length; i ++){
      if (hm.containsKey(s[i])){
        cur ^= (1 << hm[s[i]]!);
      }
      if (cur != 0 && arr[cur] == -1){
        arr[cur] = i;
      }
      // print('i: $i, cur: $cur, arr: $arr');
      res = max(res, i - arr[cur]);
    }
    return res;
  }
}