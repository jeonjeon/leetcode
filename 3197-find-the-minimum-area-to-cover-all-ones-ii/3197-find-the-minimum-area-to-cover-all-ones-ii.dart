class Solution {
  int minimumSum(List<List<int>> grid) {
    int res = 900;
    int horiLen = grid[0].length;
    final vert = List.filled(grid.length, 0);
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        vert[i] += grid[i][j] << j;
      }
    }
    vert.map((v) => v.toRadixString(2)).forEach(print);
    // 세로 나눔
    for (int i = 1; i < grid.length; i++){
      // 상단 전체
      final topWhole = getMinArea(vert, 0, i - 1, 0, horiLen - 1, horiLen);
      // 하단 전체
      final botWhole = getMinArea(vert, i, grid.length - 1, 0, horiLen - 1, horiLen);
      // 나머지 가로로 쪼개기
      for (int j = 1; j < horiLen; j++){
        final botLeft = getMinArea(vert, i, grid.length - 1, 0, j - 1, horiLen);
        final botRight = getMinArea(vert, i, grid.length - 1, j, horiLen - 1, horiLen);
        final topLeft = getMinArea(vert, 0, i - 1, 0, j - 1, horiLen);
        final topRight = getMinArea(vert, 0, i - 1, j, horiLen - 1, horiLen);
        // print('i: $i, j: $j, botLeft: $botLeft, botRight: $botRight');
        res = min(res, topWhole + botLeft + botRight);
        res = min(res, botWhole + topLeft + topRight);
      }
      // 하단 세로로 쪼개기
      if (grid.length - i - 1 > 1){
        for (int k = i + 1; k < grid.length; k++){
          final mid = getMinArea(vert, i, k - 1, 0, horiLen - 1, horiLen);
          final bot = getMinArea(vert, k, grid.length - 1, 0, horiLen - 1, horiLen);
          res = min(res, topWhole + mid + bot);
        }
      }
      // 상단 세로 쪼개기
      if (i > 1){
        for (int k = 1; k < i; k++){
          final mid = getMinArea(vert, k, i - 1, 0, horiLen - 1, horiLen);
          final top = getMinArea(vert, 0, k - 1, 0, horiLen - 1, horiLen);
          res = min(res, botWhole + mid + top);
        }
      }
    }
    // 가로 나눔
    for (int j = 1; j < horiLen; j++){
      // 왼쪽 전체
      final leftWhole = getMinArea(vert, 0, grid.length - 1, 0, j - 1, horiLen);
      // 오른쪽 전체
      final rightWhole = getMinArea(vert, 0, grid.length - 1, j, horiLen - 1, horiLen);
      // 나머지 쪼개기
      for (int i = 1; i < grid.length; i++){
        final leftTop = getMinArea(vert, 0, i - 1, 0, j - 1, horiLen);
        final leftBot = getMinArea(vert, i, grid.length - 1, 0, j - 1, horiLen);
        final rightTop = getMinArea(vert, 0, i - 1, j, horiLen - 1, horiLen);
        final rightBot = getMinArea(vert, i, grid.length - 1, j, horiLen - 1, horiLen);
        res = min(res, leftWhole + rightTop + rightBot);
        res = min(res, rightWhole + leftTop + leftBot);
      }
      // 오른쪽 가로 쪼개기
      if (horiLen - j - 1 > 1){
        for (int k = j + 1; k < horiLen; k++){
          final mid = getMinArea(vert, 0, grid.length - 1, j, k - 1, horiLen);
          final right = getMinArea(vert, 0, grid.length - 1, k, horiLen - 1, horiLen);
          res = min(res, leftWhole + mid + right);
        }
      }
      // 왼쪽 세로 쪼개기
      if (j > 1){
        for (int k = 1; k < j; k++){
          final mid = getMinArea(vert, 0, grid.length - 1, k, j - 1, horiLen);
          final left = getMinArea(vert, 0, grid.length - 1, 0, k - 1, horiLen);
          res = min(res, rightWhole + mid + left);
        }
      }
      // print('j: $j, leftWhole: $leftWhole, rightWhole: $rightWhole, res: $res');
    }
    return res;
  }
  int getMinArea(List<int> vert, int v1, int v2, int h1, int h2, int horiLen){
    final mask = ((1 << (h2 - h1 + 1)) - 1) << h1;
    int vs = -1, ve = -2, all = 0;;
    for (int i = v1; i <= v2; i++){
      final cur = vert[i] & mask;
      // print('cur: $cur');
      if (cur == 0) continue;
      if (vs == -1) vs = i;
      ve = i;
      all |= cur;
    }
    int hs = -1, he = -2;
    for (int i = 0; i < horiLen; i++){
      if (all & (1 << i) == 0) continue;
      if (hs < 0) hs = i;
      he = i;
    }
    // print('v1: $v1, v2: $v2, h1: $h1, h2: $h2, mask: ${mask.toRadixString(2)}, ve: $ve, vs: $vs, he: $he, hs: $hs');
    return (ve - vs + 1) * (he - hs + 1);
  }
}