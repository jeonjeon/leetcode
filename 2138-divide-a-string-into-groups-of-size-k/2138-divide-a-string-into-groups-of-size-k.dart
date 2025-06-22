class Solution {
  List<String> divideString(String s, int k, String fill) {
    final l = s.length;
    final res = <String>[];
    for (int i = 1; i <= l ~/ k; i++){
      res.add(s.substring((i - 1) * k, i * k));
    }
    if (l % k > 0){
      res.add(s.substring((l ~/ k) * k, l).padRight(k, fill));
    }
    return res;
  }
}