import 'dart:math';
class Solution {
  String repeatLimitedString(String s, int rl) {
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    final sb = StringBuffer('');
    for (int i = 0; i < s.length; i++){
        arr[s.codeUnitAt(i) - a]++;
    }
    // print(arr);
    for (int i = 25; i >= 0; i--){
        if (arr[i] == 0) continue;
        if (arr[i] <= rl){
            // print('i: $i, arr[i]: ${arr[i]}');
            sb.write(String.fromCharCode(i + a) * arr[i]);
            arr[i] = 0;
            continue;
        }
        while (arr[i] > 0){
            final cnt = min(rl, arr[i]);
            sb.write(String.fromCharCode(i + a) * cnt);
            arr[i] -= cnt;
            if (arr[i] == 0) break;
            int j = i - 1;
            while (j >= 0 && arr[j] == 0) j--;
            if (j < 0) break;
            sb.write(String.fromCharCode(j + a));
            arr[j]--;
        }
        // print('i: $i, sb: $sb');
    }
    return sb.toString();
  }
}