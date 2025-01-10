import 'dart:math';
class Solution {
  List<String> wordSubsets(List<String> words1, List<String> words2) {
    final res = <String>[];
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < words2.length; i++){
        final cur = List.filled(26, 0);
        for (int j = 0; j < words2[i].length; j++){
            cur[words2[i].codeUnitAt(j) - a]++;
        }
        for (int j = 0; j < 26; j++){
            arr[j] = max(arr[j], cur[j]);
        }
    }
    for (final w in words1){
        bool universal = true;
        final cur = List.filled(26, 0);
        for (int i = 0; i < w.length; i++){
            cur[w.codeUnitAt(i) - a]++;
        }
        for (int i = 0; i < 26; i++){
            if (cur[i] < arr[i]){
                universal = false;
                break;
            }
        }
        if (universal){
            res.add(w);
        }
    }
    return res;
  }
}