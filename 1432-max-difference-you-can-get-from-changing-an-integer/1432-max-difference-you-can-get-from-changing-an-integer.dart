class Solution {
  int maxDiff(int num) {
    final arr = '$num'.split('').toList();
    final not9 = arr.firstWhere((n) => n != '9', orElse: () => '');
    final not0 = arr[0] == '1' ? arr.skip(1).firstWhere((n) => n != '1' && n != '0', orElse: () => '') : arr[0];
    String small = '0';
    if (arr[0] != '1'){
      small = '1';
    }
    String a = '', b = '';
    for (int i = 0; i < arr.length; i++){
      final s = arr[i];
      if (s == not9) a += '9';
      else a += s;
      if (i == 0) {
        b += '1';
        continue;
      }
      if (s == not0) b += small;
      else b += s;
    }
    // print('not9: $not9, not0: $not0, a: $a, b: $b');
    return int.parse(a) - int.parse(b);
  }
}