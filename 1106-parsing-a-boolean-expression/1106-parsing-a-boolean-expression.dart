class Solution {
  final pth = <int, int>{};
  final op = {'&', '|', '!'};
  bool parseBoolExpr(String e) {
    final stack = <int>[];
    for (int i = 0; i < e.length; i++){
      if (e[i] == '('){
        stack.add(i);
      } else if (e[i] == ')'){
        final s = stack.removeLast();
        pth[s] = i;
      }
    }
    // print(pth);
    if (op.contains(e[0])){
      return helper(e, 0, e.length - 1);
    }
    if (e == 't') return true;
    return false;
  }
  bool helper(String e, int start, int end){
    return switch(e[start]){
      '&' => and(e, start + 1, end),
      '|' => or(e, start + 1, end),
      _ => not(e, start + 1, end),
    };
  }

  bool and(String e, int start, int end){
    for (int i = start + 1; i < end; i++){
      if (e[i] == ',') continue;
      if (e[i] == 't') continue;
      if (e[i] == 'f') return false;
      // print('e[i]: ${e[i]}, i: $i');
      final ni = pth[i + 1]!;
      final cur = helper(e, i, ni);
      if (cur == false) return false;
      i = ni;
    }
    return true;
  }

  bool or(String e, int start, int end){
    for (int i = start + 1; i < end; i++){
      if (e[i] == ',') continue;
      if (e[i] == 'f') continue;
      if (e[i] == 't') return true;
      final ni = pth[i + 1]!;
      final cur = helper(e, i, ni);
      if (cur) return true;
      i = ni;
    }
    return false;
  }
  bool not(String e, int start, int end){
    if (e[start + 1] == 't') return false;
    if (e[start + 1] == 'f') return true;
    return !helper(e, start + 1, end - 1);
  }
}