class Solution {
  String reorganizeString(String s) {
    final hm = <String, int>{};
    for (int i = 0; i < s.length; i++){
      hm[s[i]] = (hm[s[i]] ?? 0) + 1;
    }
    final ent = hm.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final arr = <List<String>>[];
    for (int i = 0; i < ent.first.value; i++){
      arr.add([ent.first.key]);
    }
    int j = 0;
    for (int i = 1; i < ent.length; i++){
      int cnt = ent[i].value;
      String key = ent[i].key;
      while(cnt > 0){
        arr[j].add(key);
        j++;
        j %= arr.length;
        cnt--;
      }
    }
    final res = arr.expand((a) => a).join('');
    
    for(int i = 1; i < res.length; i++){
      if(res[i] == res[i - 1]) return '';
    }
    return res;
  }
}