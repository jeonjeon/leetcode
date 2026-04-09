import 'dart:math';

class Solution {
  static const int MOD = 1000000007;

  int modpow(int a, int e) {
    int r = 1;
    a %= MOD;
    while (e > 0) {
      if ((e & 1) == 1) r = (r * a) % MOD;
      a = (a * a) % MOD;
      e >>= 1;
    }
    return r;
  }

  int xorAfterQueries(List<int> nums, List<List<int>> queries) {
    int n = nums.length;
    int B = sqrt(n).toInt() + 1;

    // events[k][rem] = list of [position, multiplier]
    List<List<List<List<int>>>> events = List.generate(
      B + 1,
      (i) => i == 0
          ? <List<List<int>>>[]
          : List.generate(i, (_) => <List<int>>[]),
    );

    // Process queries
    for (List<int> q in queries) {
      int l = q[0], r = q[1], k = q[2], v = q[3];

      if (k > B) {
        // direct update
        for (int i = l; i <= r; i += k) {
          nums[i] = (nums[i] * v) % MOD;
        }
      } else {
        int rem = l % k;
        int start = (l - rem) ~/ k;
        int end = (r - rem) ~/ k;

        events[k][rem].add([start, v]);

        int maxT = (n - 1 - rem) ~/ k;
        if (end + 1 <= maxT) {
          int inv = modpow(v, MOD - 2);
          events[k][rem].add([end + 1, inv]);
        }
      }
    }

    // Apply small k events
    for (int k = 1; k <= B; k++) {
      for (int rem = 0; rem < k; rem++) {
        List<List<int>> ev = events[k][rem];
        if (ev.isEmpty) continue;

        // sort events by position
        ev.sort((a, b) => a[0].compareTo(b[0]));

        // compress same positions
        List<List<int>> comp = [];
        for (List<int> p in ev) {
          if (comp.isNotEmpty && comp.last[0] == p[0]) {
            comp.last[1] = (comp.last[1] * p[1]) % MOD;
          } else {
            comp.add([p[0], p[1]]);
          }
        }

        // apply prefix multiplication
        int cur = 1;
        int ptr = 0;

        for (int t = 0, idx = rem; idx < n; t++, idx += k) {
          while (ptr < comp.length && comp[ptr][0] == t) {
            cur = (cur * comp[ptr][1]) % MOD;
            ptr++;
          }
          nums[idx] = (nums[idx] * cur) % MOD;
        }
      }
    }

    // Compute XOR
    int ans = 0;
    for (int x in nums) {
      ans ^= x;
    }

    return ans;
  }
}