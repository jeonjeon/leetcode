class Solution {
  int numberOfPairs(List<List<int>> points) {
    int res = 0;
    points.sort((a, b) {
      if (a[1] == b[1]) return a[0].compareTo(b[0]);
      return b[1].compareTo(a[1]);
    });
    for (int i = 0; i < points.length; i++){
      final [x1, y1] = points[i];
      int prevX = 51;
      for (int j = i + 1; j < points.length; j++){
        final [x2, y2] = points[j];
        // print('x1: $x1, y1: $y1, x2: $x2, y2: $y2');
        if (x2 < x1) continue;
        // print('$x2 < $x1 통과');
        if (prevX <= x2) continue;
        // print('$prevX <= $x2 통과');
        prevX = x2;
        res++;
      }
    }
    return res;
  }
}