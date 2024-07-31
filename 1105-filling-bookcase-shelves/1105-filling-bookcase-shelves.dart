import 'dart:math';
class Solution {
  int minHeightShelves(List<List<int>> books, int shelfWidth) {
    final dp = List.filled(books.length, 1000001);
    dp[0] = books[0][1];
    for (int i = 1; i < books.length; i++){
      var width = 0, height = 0;
      // print('i: $i');
      for (int j = i; j >= 0; j--){
        width += books[j][0];
        height = max(height, books[j][1]);
        if (width > shelfWidth){
          break;
        }
        // print('dp: $dp, j: $j, width: $width, height: $height');
        dp[i] = min(dp[i], height + (j == 0 ? 0 : dp[j - 1]));
      }
      // print(dp);
    }
    return dp.last;
  }
}