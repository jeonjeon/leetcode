class Solution {
  String shortestCommonSupersequence(String str1, String str2) {
    final dp = List.generate(str1.length + 1, (i) => List.generate(str2.length + 1, (j) =>  ((-1, -1), i == 0 && j == 0 ? 0 : str1.length + str2.length)));
    for (int i = 1; i < str1.length + 1; i++){
      dp[i][0] = ((i - 1, 0), dp[i - 1][0].$2 + 1);
    }
    for (int i = 1; i < str2.length + 1; i++){
      dp[0][i] = ((0, i - 1), dp[0][i - 1].$2 + 1);
    }
    for (int i1 = 0; i1 < str1.length; i1++){
      for (int i2 = 0; i2 < str2.length; i2++){
        if (str1[i1] == str2[i2]){
          dp[i1 + 1][i2 + 1] = ((i1, i2), dp[i1][i2].$2 + 1);
        }
        if (dp[i1 + 1][i2 + 1].$2 > dp[i1][i2 + 1].$2 + 1){
          dp[i1 + 1][i2 + 1] = ((i1, i2 + 1), dp[i1][i2 + 1].$2 + 1);
        }
        if (dp[i1 + 1][i2 + 1].$2 > dp[i1 + 1][i2].$2 + 1){
          dp[i1 + 1][i2 + 1] = ((i1 + 1, i2), dp[i1 + 1][i2].$2 + 1);
        }
      }
    }
    int i1 = str1.length, i2 = str2.length;
    final res = <String>[];
    while (i1 > 0 || i2 > 0){
      final ((p1, p2), _) = dp[i1][i2];
      // print('i1: $i1, i2: $i2, p1: $p1, p2: $p2');
      if (p1 == i1){
        res.add(str2[i2 - 1]);
      } else {
        res.add(str1[i1 - 1]);
      }
      i1 = p1;
      i2 = p2;
    }
    return res.reversed.join('');
  }
}

// [[[],          [2],          [2, 0],          [2, 0, 1]],
// [[0],          [0, 2],       [2, 0],          [2, 0, 0]], 
// [[0, 1],       [0, 1, 2],    [2, 0, 0],       [2, 0, 1]], 
// [[0, 1, 0],    [0, 1, 0, 2], [0, 1, 2, 0],    [2, 0, 1, 1]], 
// [[0, 1, 0, 2], [0, 1, 0, 2], [0, 1, 0, 2, 2], [2, 0, 1, 1, 1]]]