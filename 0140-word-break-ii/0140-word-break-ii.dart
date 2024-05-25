class Solution {
  final memo = <String, List<String>>{};
  List<String> wordBreak(String s, List<String> wordDict) {
    final words = wordDict.toSet();
    return dfs(s, words);
  }
  List<String> dfs(String s, Set<String> words){
    final res = <String>[];
    for (int i = 0; i < s.length; i++){
      final cur = s.substring(0, i + 1);
      final next = s.substring(i + 1);
      if(words.contains(cur)){
        if (next.isEmpty){
          res.add(cur);
          break;
        }
        memo[next] ??= dfs(next, words);
        for (final n in memo[next]!){
          res.add('$cur $n');
        }
      } 
    }
    return res;
  }
}