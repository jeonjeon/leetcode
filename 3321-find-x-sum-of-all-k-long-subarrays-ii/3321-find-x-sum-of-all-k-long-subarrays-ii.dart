import 'dart:collection';

class Solution {
  List<int> findXSum(List<int> nums, int k, int x) {
    final res = List.filled(nums.length - k + 1, 0);
    
    final bot = SplayTreeSet<(int, int)>((a, b) {
      if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
      if (a.$2 != b.$2) return a.$2.compareTo(b.$2);
      return 0; // 완전히 같은 경우만 0
    });
    
    final top = SplayTreeSet<(int, int)>((a, b) {
      if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
      if (a.$2 != b.$2) return a.$2.compareTo(b.$2);
      return 0;
    });
    
    final hm = <int, int>{};
    int cur = 0;
    
    void update(int n, int add) {
      final count = hm[n] ?? 0;
      
      if (count > 0) {
        if (!bot.remove((count, n))) {
          top.remove((count, n));
          cur -= n * count;
        }
      }
      
      hm[n] = count + add;
      if (hm[n] == 0) {
        hm.remove(n);
        return;
      }
      
      bot.add((hm[n]!, n));
    }
    
    for (int i = 0; i < nums.length; i++) {
      if (i >= k) {
        update(nums[i - k], -1);
      }
      update(nums[i], 1);
      
      while (bot.isNotEmpty && top.length < x) {
        final largest = bot.last;
        bot.remove(largest);
        cur += largest.$1 * largest.$2;
        top.add(largest);
      }
      
      while (bot.isNotEmpty && top.isNotEmpty) {
        final botMax = bot.last;
        final topMin = top.first;
        
        if (botMax.$1 > topMin.$1 || 
            (botMax.$1 == topMin.$1 && botMax.$2 > topMin.$2)) {
          bot.remove(botMax);
          top.remove(topMin);
          
          cur -= topMin.$1 * topMin.$2;
          cur += botMax.$1 * botMax.$2;
          
          top.add(botMax);
          bot.add(topMin);
        } else {
          break;
        }
      }
      
      if (i >= k - 1) {
        res[i - k + 1] = cur;
      }
    }
    
    return res;
  }
}