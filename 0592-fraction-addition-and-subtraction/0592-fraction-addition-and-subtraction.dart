class Solution {
  String fractionAddition(String exp) {
    var res = (0, 0);
    var cur = '';
    for (int i = 0; i < exp.length; i++){
      if (cur.isNotEmpty && (exp[i] == '-' || exp[i] == '+')){
        final cs = cur.split('/');
        final numer = int.parse(cs[0]); 
        final denom = int.parse(cs[1]);
        if (res.$1 == 0){
          res = (numer, denom);
        } else {
          var (pn, pd) = res;
          final lcm = _lcm(pd, denom);
          // print('pn: $pn, pd: $pd, numer: $numer, denom: $denom, lcm: $lcm');
          pn = pn * (lcm ~/ pd) + numer * (lcm ~/ denom);
          pd = lcm;
          // print('pn: $pn, pd: $pd');
          if (pn == 0){
            res = (0, 1);
          } else {
            final gcd = _gcd(pn, pd);
            res = (pn ~/ gcd, pd ~/ gcd);
          }
        }
        // print('i: $i, res: $res');
        cur = '';
      }
      cur += exp[i];
    }
    final cs = cur.split('/');
    final numer = int.parse(cs[0]); 
    final denom = int.parse(cs[1]);
    // print('cur: $cur, res: $res, numer: $numer, denom: $denom');
    if (res.$1 == 0){
      res = (numer, denom);
    } else {
      var (pn, pd) = res;
      final lcm = _lcm(pd, denom); 
      // print('pd: $pd, denom: $denom, lcm: $lcm');
      pn = pn * (lcm ~/ pd) + numer * (lcm ~/ denom);
      pd = lcm;
      if (pn == 0) {
        return '${pn}/1';
      }
      final gcd = _gcd(pn, pd);
      // print('pn: $pn, pd: $pd, gcd: $gcd');
      res = (pn ~/ gcd, pd ~/ gcd);
      // print('res: $res');
    }
    return '${res.$1}/${res.$2}';
  }
  int _lcm(int a, int b){
    final gcd = _gcd(a, b);
    return a * b ~/ gcd;
  }
  int _gcd(int a, int b){
    if (a < b) return _gcd(b, a);
    while (a % b != 0){
      final mod = a % b;
      a = b;
      b = mod;
    }
    return b.abs();
  }
}