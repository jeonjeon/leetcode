class Solution {
  List<int> relativeSortArray(List<int> arr1, List<int> arr2) {
    final hm = <int, int>{};
    for (final a in arr1){
      hm[a] = (hm[a] ?? 0) + 1;
    }
    //print('hm: $hm');
    int i = 0;
    for(final a in arr2){
      while (hm[a]! > 0){
        arr1[i] = a;
        i++;
        hm[a] = hm[a]! - 1;
      }
      hm.remove(a);
    }
    //print('arr1: $arr1');
    
    final ent = hm.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
    for(final e in ent){
      for (int _ = 0; _ < e.value; _++){
        arr1[i] = e.key;
        i++;
      }
    }
    //print('arr1: $arr1');
    return arr1;
  }
}