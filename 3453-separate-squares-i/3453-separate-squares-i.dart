import 'dart:math';
class Solution {
  double separateSquares(List<List<int>> squares) {
    final tot = squares.map((s) => s[2])
                       .map((a) => a * a * 1.0)
                       .reduce((a, b) => a + b);
    // print(tot);
    // print(getBot(squares,  1.0));
    double l = 0.0, r = 2000000000.0;
    while (l <= r){
      final m = (l + r) / 2;
      final bot = getBot(squares, m);
      final top = tot - bot;
      // print('m: $m, top: $top, bot: $bot');
      // if () return m;
      if (bot > top || bot.toStringAsFixed(5) == top.toStringAsFixed(5)){
        r = m - .00001;
      } else {
        l = m + .00001;
      }
    }
    return l;
  }
  double getBot(List<List<int>> squares, double hori){
    double res = 0;
    for (final [x, y, l] in squares){
      
      res += l * 1.0 * min(l * 1.0, max(0.0, hori - y * 1.0));
    }
    return res;
  }
}