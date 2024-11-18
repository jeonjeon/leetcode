class Solution {
  List<int> decrypt(List<int> code, int k) {
    final n = code.length;
    if (k == 0){
        return List.filled(n, 0);
    }
    final prefix = List<int>.from(code);
    for (int i = 1; i < n; i++){
        prefix[i] += prefix[i - 1];
    }
    if (k > 0){
        for (int i = 0; i < n; i++){
            final end = i + k;
            int cur = 0;
            if (end >= n){
                cur += prefix.last - prefix[i];
                cur += prefix[end % n];
            } else {
                cur += prefix[end] - prefix[i];
            }
            code[i] = cur;
        }
    } else {
        for (int i = 0; i < n; i++){
            final start = i + k - 1;
            int cur = 0;
            if (start < 0){
                if (i > 0){
                    cur += prefix[i - 1];
                }
                cur += prefix.last - prefix[start + n];
            } else {
                // print('i: $i, start: $start');
                cur += prefix[i - 1] - prefix[start];
            }
            code[i] = cur;
        }
    }
    return code;
  }
}