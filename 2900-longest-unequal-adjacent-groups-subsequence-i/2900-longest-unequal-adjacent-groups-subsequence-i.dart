class Solution {
  List<String> getLongestSubsequence(List<String> words, List<int> groups) {
    final a = subsIdx(groups, words, 0);
    final b = subsIdx(groups, words, 1);
    if (a.length > b.length) return a;
    return b;
  }
  List<String> subsIdx (List<int> groups, List<String> words, int cur) {
    final res = <String>[];
    for (int i = 0; i < groups.length; i++){
        if (groups[i] == cur){
            res.add(words[i]);
            cur = (cur + 1) % 2;
        }
    }
    return res;
  }
}