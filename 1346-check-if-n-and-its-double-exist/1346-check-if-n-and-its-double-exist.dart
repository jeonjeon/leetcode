class Solution {
  bool checkIfExist(List<int> arr) {
    final sett = <int>{};
    for (final a in arr){
        if (sett.contains(a * 2)){
            return true;
        }
        if (a % 2 == 0 && sett.contains(a ~/ 2)) {
            return true;
        }
        sett.add(a);
    }
    return false;
  }
}