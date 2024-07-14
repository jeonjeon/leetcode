class Solution {
  final A = 'A'.codeUnitAt(0);
  final Z = 'Z'.codeUnitAt(0);
  final a = 'a'.codeUnitAt(0);
  final z = 'z'.codeUnitAt(0);

  String countOfAtoms(String f) {
    final stack = <Map<String,int>>[];
    var cur = '';
    int cnt = 0;
    for (int i = 0; i < f.length; i++){
      final n = int.tryParse(f[i]);
      // 숫자인데 cur 비었으면
      if (n != null && cur.isEmpty){
        cnt *= 10;
        cnt += n!;
        continue;
      }
      // 숫자인데 cur 안비었으면
      if (n != null && cur.isEmpty){
        cur += f[i];
        continue;
      }
      // 숫자아니고 cnt > 0인데 
      if(cnt > 0){
        final last = stack.removeLast();
        for (final ent in last.entries){
          last[ent.key] = ent.value * cnt;
        }
        if (stack.isNotEmpty){
          final prev = stack.removeLast();
          for (final ent in prev.entries){
            last[ent.key] = (last[ent.key] ?? 0) + ent.value;
          }
        }
        var result = last.entries.map((e) => '${e.key}${e.value == 1 ? "" : e.value}').toList()..sort((a, b) => a.compareTo(b));
        cur = result.join('');
        //print('cur: $cur, stack: $stack');
        cnt = 0;
      }
      // 괄호열고면 
      if (f[i] == '('){
        if (cur.length > 0){
          stack.add(toMap(cur));
        }
        cur = '';
        continue;
      }
      // 괄호닫고면
      if (f[i] == ')'){
        stack.add(toMap(cur));
        cur = '';
        continue;
      }
      // 숫자 아니고 cur도 비었고 괄호도 아니면 문자다
      cur += f[i];
    }
    //print('stack: $stack, cnt: $cnt');
    var res = <String, int>{};
    if (stack.isNotEmpty) {
      res = stack.removeLast();
    }
    // 카운트 남았으면 곱해
    if (cnt > 0){
      for (final ent in res.entries){
        res[ent.key] = ent.value * cnt;
      }
      cnt = 0;
    }
    //print('res: $res, cnt: $cnt');
    // 남은 stack이나 cur있으면 쥐어짬
    if (cur.isNotEmpty){
      final inner = toMap(cur);
      for (final ent in inner.entries){
        res[ent.key] = (res[ent.key] ?? 0) + ent.value;
      }
    } 
    if (stack.isNotEmpty){
      final last = stack.last;
      for (final ent in last.entries){
        res[ent.key] = (res[ent.key] ?? 0) + ent.value;
      }
    }
    var result = res.entries.map((e) => '${e.key}${e.value == 1 ? "" : e.value}').toList()..sort((a, b) => a.compareTo(b));
    //print(result);
    return result.join('');
  }

  // 원소 맵으로 추출하는 함수
  Map<String, int> toMap(String cur){
    if (cur.isEmpty) return {};
    final res = <String, int>{};
    var atom = '';
    int cnt = 0;
    for (int i = 0; i < cur.length; i++){
      final n = int.tryParse(cur[i]);
      // 숫자일때
      if (n != null){
        cnt *= 10;
        cnt += n!;
        continue;
      } 
      final code = cur.codeUnitAt(i);
      // 소문자일때
      if (code >= a && code <= z){
        atom += cur[i];
        continue;
      }
      // 대문자일때
      if (code >= A && code <= Z){
        // 기존 atom이 있을 때
        if (atom.isNotEmpty){
          res[atom] = (res[atom] ?? 0) + (cnt == 0 ? 1 : cnt);
          atom = '';
          cnt = 0;
        }
        atom += cur[i];
        continue;
      }
    }
    if (atom.isNotEmpty){
      res[atom] = (res[atom] ?? 0) + (cnt == 0 ? 1 : cnt);
      atom = '';
      cnt = 0;
    }
    return res;
  }
}