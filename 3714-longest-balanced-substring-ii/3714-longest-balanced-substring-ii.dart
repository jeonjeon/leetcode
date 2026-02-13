class Solution {
  int longestBalanced(String s) {
    int n = s.length;
    int ans = 0;
    int i = 0;
    
    // 연속된 같은 문자의 최대 길이 찾기
    while (i < n) {
      int j = i;
      while (j < n && s[j] == s[i]) {
        j++;
      }
      ans = ans > (j - i) ? ans : (j - i);
      i = j;
    }
    
    // 두 개의 문자로만 이루어진 balanced 부분 문자열 찾기
    int best2(String x, String y, String third) {
      int best = 0;
      int i = 0;
      
      while (i < n) {
        if (s[i] == third) {
          i++;
          continue;
        }
        
        int st = i;
        int bal = 0;
        Map<int, int> fst = {0: st};
        int j = st;
        
        while (j < n && s[j] != third) {
          bal += (s[j] == x ? 1 : -1);
          if (!fst.containsKey(bal)) {
            fst[bal] = j + 1;
          } else {
            best = best > (j + 1 - fst[bal]!) ? best : (j + 1 - fst[bal]!);
          }
          j++;
        }
        i = j;
      }
      return best;
    }
    
    ans = ans > best2('a', 'b', 'c') ? ans : best2('a', 'b', 'c');
    ans = ans > best2('a', 'c', 'b') ? ans : best2('a', 'c', 'b');
    ans = ans > best2('b', 'c', 'a') ? ans : best2('b', 'c', 'a');
    
    // 세 개의 문자가 모두 같은 개수로 나타나는 부분 문자열 찾기
    int ca = 0, cb = 0, cc = 0;
    Map<String, int> mp = {'0,0': -1};
    
    for (int i = 0; i < n; i++) {
      if (s[i] == 'a') {
        ca++;
      } else if (s[i] == 'b') {
        cb++;
      } else {
        cc++;
      }
      
      String key = '${ca - cb},${ca - cc}';
      if (mp.containsKey(key)) {
        ans = ans > (i - mp[key]!) ? ans : (i - mp[key]!);
      } else {
        mp[key] = i;
      }
    }
    
    return ans;
  }
}