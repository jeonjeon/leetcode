import 'dart:collection';
class AllOne {
  final hm = <String, int>{};
  final stm = SplayTreeMap<int, Set<String>>((a, b) => a.compareTo(b));
  
  void inc(String key) {
    if (!hm.containsKey(key)){
      hm[key] = 1;
      (stm[1] ??= {}).add(key);
      return;
    }
    final cnt = hm[key]!;
    stm[cnt]!.remove(key);
    if (stm[cnt]!.isEmpty){
      stm.remove(cnt);
    }
    hm[key] = hm[key]! + 1;
    (stm[cnt + 1] ??= {}).add(key);
    // print('<inc> key: $key, hm: $hm, stm: $stm');
    
  }
  
  void dec(String key) {
    final cnt = hm[key]!;
    stm[cnt]!.remove(key);
    if (stm[cnt]!.isEmpty){
      stm.remove(cnt);
    }
    hm[key] = hm[key]! - 1;
    if (hm[key] == 0){
      hm.remove(key);
    }
    (stm[cnt - 1] ??= {}).add(key);
    // print('<dec> key: $key, hm: $hm, stm: $stm');
  }
  
  String getMaxKey() {
    final maxCnt = stm.lastKey() ?? 0;
    // print('<getMaxKey> hm: $hm, stm: $stm');
    if (maxCnt == 0) return '';
    if (stm[maxCnt]!.isEmpty) return '';
    return stm[maxCnt]!.first;
  }
  
  String getMinKey() {
    final minCnt = stm.firstKey() ?? 0;
    // print('<getMinKey> hm: $hm, stm: $stm');
    if (minCnt == 0) return '';
    if (stm[minCnt]!.isEmpty) return '';
    return stm[minCnt]!.first;
  }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * AllOne obj = AllOne();
 * obj.inc(key);
 * obj.dec(key);
 * String param3 = obj.getMaxKey();
 * String param4 = obj.getMinKey();
 */