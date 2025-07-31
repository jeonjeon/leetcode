class Solution {
  int subarrayBitwiseORs(List<int> arr) {
    final total = <int>{};
    var cur = <int>{};
    for (final a in arr){
        final temp = {a};
        for (final t in cur){
            temp.add(a | t);
        }
        cur = temp;
        total.addAll(cur);
    }
    return total.length;
  }
}