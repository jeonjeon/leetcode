import 'dart:math';
class Solution {
  int numOfUnplacedFruits(List<int> F, List<int> B) {
    int res = F.length;
    final root = sqrt(B.length).floor();
    final arr = <int>[];
    int mx = 0;
    for (int i = 0; i < B.length; i++){
      mx = max(mx, B[i]);
      if ((i + 1) % root == 0 || (i + 1) == B.length){
        arr.add(mx);
        mx = 0;
      } 
    }
    // print(arr);
    for (final f in F){
      for (int i = 0; i < arr.length; i++){
        if (arr[i] < f) continue;
        bool can = false;
        int localMx = 0;
        for (int j = 0; j < root; j++){
          if (i * root + j >= B.length) break;
          if (!can && f <= B[i * root + j]) {
            can = true;
            B[i * root + j] = 0;
          }
          localMx = max(localMx, B[i * root + j]);
        }
        if (!can) continue;
        res--;
        arr[i] = localMx;
        // print('res: $res, arr: $arr');
        break;
      }
    }
    return res;

  }
}