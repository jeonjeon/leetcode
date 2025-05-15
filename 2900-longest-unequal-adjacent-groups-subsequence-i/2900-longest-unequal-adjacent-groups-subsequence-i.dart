class Solution {
  List<String> getLongestSubsequence(List<String> words, List<int> groups) {
    final a = subsIdx(groups, 0);
    final b = subsIdx(groups, 1);
    if (a.length > b.length) return a.map((i) => words[i]).toList();
    return b.map((i) => words[i]).toList();
  }
  List<int> subsIdx (List<int> groups, int cur) {
    final res = <int>[];
    for (int i = 0; i < groups.length; i++){
        if (groups[i] == cur){
            res.add(i);
            cur = (cur + 1) % 2;
        }
    }
    return res;
  }
}