import 'dart:collection';

class Solution {
  int maxDistance(int side, List<List<int>> points, int k) {
    final List<int> res = [];

    for (final p in points) {
      int x = p[0], y = p[1];
      if (x == 0) {
        res.add(y);
      } else if (y == side) {
        res.add(side + x);
      } else if (x == side) {
        res.add(side * 3 - y);
      } else {
        res.add(side * 4 - x);
      }
    }

    res.sort();

    // 중복 값도 처리하기 위해 value에 count 저장
    final SplayTreeMap<int, int> tree = SplayTreeMap();
    for (final v in res) {
      tree[v] = (tree[v] ?? 0) + 1;
    }

    bool check(int n) {
      final List<int> idx = List.filled(k, 0);
      int curr = res[0];

      for (int i = 1; i < k; i++) {
        // bisectLeft(res, curr + n) 대응: curr+n 이상인 첫 번째 키
        final next = tree.firstKeyAfter(curr + n - 1);
        if (next == null) return false;
        idx[i] = res.indexOf(next); // ← 아래 설명 참고
        curr = next;
      }

      if (curr - res[0] <= side * 4 - n) return true;

      for (idx[0] = 1; idx[0] < idx[1]; idx[0]++) {
        for (int j = 1; j < k; j++) {
          while (res[idx[j]] < res[idx[j - 1]] + n) {
            idx[j]++;
            if (idx[j] == res.length) return false;
          }
        }
        if (res[idx[k - 1]] - res[idx[0]] <= side * 4 - n) return true;
      }
      return false;
    }

    int left = 1, right = side + 1;
    while (left + 1 < right) {
      int mid = (left + right) ~/ 2;
      if (check(mid)) {
        left = mid;
      } else {
        right = mid;
      }
    }
    return left;
  }
}