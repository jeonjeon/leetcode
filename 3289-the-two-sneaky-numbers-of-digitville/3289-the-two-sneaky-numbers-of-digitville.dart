class Solution {
  List<int> getSneakyNumbers(List<int> nums) {
    final res = <int>[];
    final sett = <int>{};
    for (final n in nums){
        if (sett.contains(n)) {
            res.add(n);
            continue;
        }
        sett.add(n);
    }
    return res;
  }
}