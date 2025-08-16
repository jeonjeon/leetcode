class Solution {
  int maximum69Number (int num) {
    final sNum = '$num'.split('').toList();
    final i = sNum.indexWhere((s) => s == '6');
    if (i >= 0){
      sNum[i] = '9';
    }
    return int.parse(sNum.join(''));
  }
}