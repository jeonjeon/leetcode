import 'dart:collection';
class FoodRatings {
  final hm = <String, SplayTreeMap<int, SplayTreeSet<String>>>{};
  final food = <String, (int, String)>{};
  FoodRatings(List<String> f, List<String> c, List<int> r) {
    for (int i = 0; i < f.length; i++){
      ((hm[c[i]] ??= SplayTreeMap((a, b) => b.compareTo(a)))[r[i]] ??= SplayTreeSet()).add(f[i]);
      food[f[i]] = (r[i], c[i]);
    }
  }
  
  void changeRating(String f, int n) {
    final (r, c) = food[f]!;
    hm[c]![r]!.remove(f);
    if (hm[c]![r]!.isEmpty) hm[c]!.remove(r);
    (hm[c]![n] ??= SplayTreeSet()).add(f);
    food[f] = (n, c);
  }
  
  String highestRated(String c) {
    final key = hm[c]!.firstKey();
    final sts = hm[c]![key]!;
    return sts.first;
  }
}

/**
 * Your FoodRatings object will be instantiated and called as such:
 * FoodRatings obj = FoodRatings(foods, cuisines, ratings);
 * obj.changeRating(food,newRating);
 * String param2 = obj.highestRated(cuisine);
 */