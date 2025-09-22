import 'dart:collection';
class MovieRentingSystem {
  final unrented = SplayTreeMap<int, SplayTreeMap<int, SplayTreeSet<int>>>(); // m -> p -> s
  final smToP = <String, int>{};
  final rented = SplayTreeMap<int, SplayTreeMap<int, SplayTreeSet<int>>>(); // p -> s -> m
  MovieRentingSystem(int n, List<List<int>> entries) {
    for (final [s, m, p] in entries){
      ((unrented[m] ??= SplayTreeMap())[p] ??= SplayTreeSet()).add(s);
      smToP['$s,$m'] = p;
    }
  }
  // unrented
  // price, storeid asc
  List<int> search(int m) {
    final res = <int>[];
    if (unrented[m] == null) return [];
    for (final sts in unrented[m]!.values){
        res.addAll(sts.take(5 - res.length));
        if (res.length == 5) return res;
    }
    return res;
  }
  
  void rent(int s, int m) {
    final p = smToP['$s,$m']!;
    unrented[m]![p]!.remove(s);
    if (unrented[m]![p]!.isEmpty) unrented[m]!.remove(p);
    if (unrented[m]!.isEmpty) unrented.remove(m);
    ((rented[p] ??= SplayTreeMap())[s] ??= SplayTreeSet()).add(m);
  }
  
  void drop(int s, int m) {
    final p = smToP['$s,$m']!;
    rented[p]![s]!.remove(m);
    if (rented[p]![s]!.isEmpty) rented[p]!.remove(s);
    if (rented[p]!.isEmpty) rented.remove(p);
    ((unrented[m] ??= SplayTreeMap())[p] ??= SplayTreeSet()).add(s);
  }
  // rented
  // price, storeid, movieid asc
  List<List<int>> report() {
    final res = <List<int>>[];
    for (final stm in rented.values){
        for (final s in stm.keys){
            for (final m in stm[s]!){
                res.add([s, m]);
                if (res.length == 5){
                    return res;
                }
            }
        }
    }
    return res;
  }
}

/**
 * Your MovieRentingSystem object will be instantiated and called as such:
 * MovieRentingSystem obj = MovieRentingSystem(n, entries);
 * List<int> param1 = obj.search(movie);
 * obj.rent(shop,movie);
 * obj.drop(shop,movie);
 * List<List<int>> param4 = obj.report();
 */