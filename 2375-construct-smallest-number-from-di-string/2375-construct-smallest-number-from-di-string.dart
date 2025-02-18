class Solution {
  String smallestNumber(String p) {
    int D = 0;
    int mx = p.length + 1;
    String res = '';
    for (int i = p.length - 1; i >= 0; i--){
        if (p[i] == 'D'){
            D++;
            continue;
        }
        String cur = '${mx--}';
        while (D > 0){
            cur += '${mx--}';
            D--;
        }
        res = cur + res;
        // print('i: $i, cur: $cur, res: $res');
    }
    // print(res);
    String cur = '${mx--}';
    while (D > 0){
        cur += '${mx--}';
        D--;
    }
    while (mx > 0){
        cur = '${mx--}' + cur;
    }
    res = cur + res;
    return res;
  }
}