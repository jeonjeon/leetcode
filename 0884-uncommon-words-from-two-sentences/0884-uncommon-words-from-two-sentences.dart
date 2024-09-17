class Solution {
  List<String> uncommonFromSentences(String s1, String s2) {
    final hm = <String, int>{};
    final l1 = s1.split(' ').toList();
    final l2 = s2.split(' ').toList();
    for (final l in l1){
      hm[l] = (hm[l] ?? 0) + 1;
    }
    for (final l in l2){
      hm[l] = (hm[l] ?? 0) + 1;
    }
    return hm.entries.where((e) => e.value == 1)
             .map((e) => e.key)
             .toList();
  }
}