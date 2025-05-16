class Solution {
  List<String> getWordsInLongestSubsequence(List<String> words, List<int> groups) {
    final len = groups.length;
    final size = List.filled(len, 1);
    final link = List.generate(len, (i) => i);
    int totalMx = 0, totalMi = 0;
    for (int i = 1; i < len; i++){
      int mx = 0, mi = -1;
      for (int j = i - 1; j >= 0; j--){
        if (groups[i] == groups[j] || !oneHam(words[i], words[j])) continue;
        if (mx >= size[j]) continue;
        mx = size[j];
        mi = j;
      }
      if (mx > 0){
        size[i] += mx;
        link[i] = mi;
      }
      if (totalMx < mx){
        totalMx = mx;
        totalMi = i;
      }
    }
    final reversedIdx = <int>[];
    while (link[totalMi] != totalMi){
      reversedIdx.add(totalMi);
      totalMi = link[totalMi];
    }
    reversedIdx.add(totalMi);
    return reversedIdx.reversed.map((i) => words[i]).toList();
  }

  bool oneHam(String a, String b){
    if (a.length != b.length) return false;
    int diff = 0;
    for (int i = 0; i < a.length; i++){
      if (a[i] != b[i]) diff++;
      if (diff > 1) return false;
    }
    return true;
  }
}