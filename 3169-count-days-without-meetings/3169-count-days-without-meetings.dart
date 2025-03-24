class Solution {
  int countDays(int days, List<List<int>> meetings) {
    int m = 0, l = 0, res = 0;
    final meet = <(int, int)>[];
    for (final [s, e] in meetings){
        meet.add((s, 1));
        meet.add((e, -1));
    }
    meet.sort((a, b) {
        if (a.$1 == b.$1){
            return b.$2.compareTo(a.$2);
        }
        return a.$1.compareTo(b.$1);
    });
    // print(meet);
    for (final (d, op) in meet){
        if (m == 0){
            res += d - l - 1;
        }
        m += op;
        if (m == 0){
            l = d;
        }
        // print('m: $m, l: $l, res: $res');
    }
    // print('l: $l');
    return res + days - l;
  }
}