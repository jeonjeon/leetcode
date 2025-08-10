class Solution {
  bool reorderedPowerOf2(int n) {
    final sett = <String>{};
    for (int i = 1; i <= 1000000000; i <<= 1){
      sett.add(toSortedString(i));
    }
    return sett.contains(toSortedString(n));
  }
  String toSortedString(int n){
    final sArr = '$n'.split('').toList()..sort();
    return sArr.join('');
  }
}