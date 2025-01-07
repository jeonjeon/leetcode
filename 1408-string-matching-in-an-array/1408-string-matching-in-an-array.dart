class Solution {
  List<String> stringMatching(List<String> words) {
    final res = <String>[];
    for (int i = 0; i < words.length; i++){
        for (int j = 0; j < words.length; j++){
            if (i == j) continue;
            final a = words[i];
            final b = words[j];
            if (a.contains(b)) {
                res.add(b);
            }
        }
    }
    return res;
  }
}