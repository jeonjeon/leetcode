class Solution {
  List<List<int>> getAncestors(int n, List<List<int>> edges) {
    var sett = List.generate(n, (i) => i).toSet();
    final hm = <int, List<int>>{};
    final res = List.generate(n, (i) => <int>{});
    for (final e in edges){
      hm[e[0]] ??= [];
      hm[e[0]]!.add(e[1]);
      sett.remove(e[1]);
    }
    while (sett.isNotEmpty){
      final temp = <int>{};
      for (final s in sett){
        if (!hm.containsKey(s)){
          continue;
        }
        final next = hm[s]!;
        for (final n in next){
          res[n].addAll({...res[s], s});
          temp.add(n);
        }
      }
      sett = temp;
    }
    return res.map((r) => r.toList()..sort()).toList();
  }
}