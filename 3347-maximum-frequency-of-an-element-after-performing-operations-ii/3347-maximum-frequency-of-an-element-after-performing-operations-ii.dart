import 'dart:math';
class Solution {
  int maxFrequency(List<int> nums, int k, int op) {
    int res = 0;
    // nums to [number, count] list
    final arr = nums.fold<Map<int, int>>({0: 0}, (m, n) {
                    m[n] = (m[n] ?? 0) + 1;
                    return m;
                })
                .entries.map((e) => [e.key, e.value]).toList()
                ..sort((a, b) => a[0].compareTo(b[0]));
    // prefix sum
    for (int i = 1; i < arr.length; i++){
        arr[i][1] += arr[i - 1][1];
    }
    // print(arr);
    // sliding window
    int l = 0, r = 0;
    for (int i = 0; i < arr.length; i++){
        var [n, cnt] = arr[i];
        if (i > 0) cnt -= arr[i - 1][1];
        // current freq
        res = max(res, cnt);

        final minVal = max(0, n - k);
        final maxVal = min(arr.last.first, n + k);
        // left sliding
        while (l < i && arr[l + 1][0] < minVal) l++;
        // right sliding
        while (r < arr.length - 1 && arr[r + 1][0] <= maxVal) r++;
        // print('i: $i, n: $n, cnt: $cnt, minVal: $minVal, maxVal: $maxVal, l: $l, r: $r');
        res = max(res, min(cnt + op, arr[r][1] - arr[l][1]));
    }
    // sliding 2
    l = 0;
    for (r = 0; r < arr.length; r++){
        final [n, cnt] = arr[r];
        final minVal = max(0, n - k * 2);
        while (l < r && arr[l + 1][0] < minVal) l++;
        // print('l: $l, r: $r');
        res = max(res, min(op, arr[r][1] - arr[l][1]));
    }
    return res;
  }
}