class Solution {
  List<String> twoEditWords(List<String> queries, List<String> dictionary) {
    final res = <String>[];
    for (final q in queries){
      for (final d in dictionary){
        if (same(q, d)){
          res.add(q);
          break;
        } 
      }
    }
    return res;
  }
  bool same(String a, String b){
    int diff = 0;
    for (int i = 0; i < a.length; i++){
      if (a[i] != b[i]) diff++;
      if (diff > 2) return false;
    }
    return true;
  }
}