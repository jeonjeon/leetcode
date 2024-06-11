import 'dart:math';
class Solution {
  int distributeCookies(List<int> cookies, int k) {
    final n = cookies.length;
    int bit = 0;
    for (int i = 0; i < n; i++){
      bit <<= 1;
      bit++;
    }
    final arr = List.generate(k, (_) => List.filled(bit + 1, 0));
    for (int i = 1; i < arr[0].length; i++){
      int sum = 0;
      for(int j = 0; j < cookies.length; j++){
        if ((1 << j) & i > 0){
          sum += cookies[j];
        }
      }
      arr[0][i] = sum;
    }
    for (int i = 1; i < k; i++) {
      // i명이서 j가 남았을 때 가장 작은 최대값
      for (int j = 1; j < arr[0].length; j++){
        int mn =  1000000;
        for (int l = 1; l < arr[0].length; l++){
          if (l & j == l){
            final xor = j ^ l;
            mn = min(mn, max(arr[0][xor], arr[i - 1][l]));
          }
        }
        arr[i][j] = mn;
      }
    }
    //print(arr.last);
    return arr.last.last;
  }
}
