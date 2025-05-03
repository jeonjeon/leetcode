class Solution {
  String pushDominoes(String dom) {
    int prev = -1;
    String res = '';
    for (int i = 0; i < dom.length; i++){
        if (dom[i] == '.') continue;
        final d = i - prev - 1;
        if (prev == -1){
            if (dom[i] == 'L'){
                res += 'L' * i;
            } else {
                res += '.' * i;
            }
        } else if (dom[prev] == 'R'){
            if (dom[i] == 'L'){
                res += 'R' * (d ~/ 2);
                res += '.' * (d % 2);
                res += 'L' * (d ~/ 2);
            } else {
                res += 'R' * d;
            }
        } else if (dom[prev] == 'L'){
            if (dom[i] == 'L'){
                res += 'L' * d;
            } else {
                res += '.' * d;
            }
        }
        res += dom[i];
        prev = i;
    }
    if (prev > -1 && dom[prev] == 'R'){
      res += 'R' * (dom.length - prev - 1);
    } else {
      res += '.' * (dom.length - prev - 1);
    }
    return res;
  }
}