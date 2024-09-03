class Solution {
  int getLucky(String s, int k) {
    final a = 'a'.codeUnitAt(0);
    s = s.split('')
               .map((ss) => ss.codeUnitAt(0) - a + 1)
               .fold('', (a, b) => '$a$b');
      // print(s);
    for (int i = 0; i < k; i++){
      s = transform(s);
      // print(s);
    }
    return int.parse(s);
  }
  String transform(String s){
    int res = 0;
    for (int i = 0; i < s.length; i++){
      res += int.parse(s[i]);
    }
    return '$res';
  }
}