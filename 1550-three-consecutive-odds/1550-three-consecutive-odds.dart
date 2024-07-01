class Solution {
  bool threeConsecutiveOdds(List<int> arr) {
    int cnt = 0;
    for (final a in arr){
      if (a % 2 == 1){
        cnt++;
      } else {
        cnt = 0;
      }
      if (cnt == 3){
        return true;
      }
    }
    return false;
  }
}