import 'dart:math';
class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int res = 0;
    final len = max(startPos, fruits.last.first) + 1;
    final prefix = List.filled(len, 0);
    for (final [p, a] in fruits){
        prefix[p] = a;
    }
    for (int i = 1; i < prefix.length; i++){
        prefix[i] += prefix[i - 1];
    }
    for (final [p, a] in fruits){
        int step = k;
        int l = startPos, r = startPos;
        if (p < startPos){
            final leftDiff = startPos - p;
            step -= leftDiff;
            if (step < 0) continue;
            l = p;
            res = max(res, prefix[r] - (l == 0 ? 0 : prefix[l - 1]));
            step -= leftDiff;
            if (step < 0) continue;
            r = min(startPos + step, len - 1);
            res = max(res, prefix[r] - (l == 0 ? 0 : prefix[l - 1]));
            continue;
        }
        final rightDiff = p - startPos;
        step -= rightDiff;
        if (step < 0) continue;
        r = p;
        res = max(res, prefix[r] - (l == 0 ? 0 : prefix[l - 1]));
        step -= rightDiff;
        if (step < 0) continue;
        l = max(0, startPos - step);
        res = max(res, prefix[r] - (l == 0 ? 0 : prefix[l - 1]));
    }
    return res;
  }
}