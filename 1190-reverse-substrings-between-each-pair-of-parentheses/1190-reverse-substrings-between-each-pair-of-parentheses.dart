class Solution {
  String reverseParentheses(String s) {
    final stack = <String>[];
    var cur = '';
    for (int i = 0; i < s.length; i++){
      print('cur: $cur, stack: $stack, s[i]: ${s[i]}');
      if (s[i] == '('){
        stack.add(cur);
        cur = '';
        continue;
      }
      if (s[i] == ')'){
        cur = (stack.isNotEmpty ? stack.removeLast() : '') + cur.split('').reversed.join('');
        continue;
      }
      cur += s[i];
    }
    return (stack.isNotEmpty ? stack.removeLast() : '') + cur;
  }
}