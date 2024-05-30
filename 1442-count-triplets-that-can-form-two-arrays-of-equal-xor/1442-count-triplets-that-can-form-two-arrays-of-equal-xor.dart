class Solution {
  int countTriplets(List<int> arr) {
    int res = 0;
    final px = List.filled(arr.length + 1, 0);
    for (int i = 0; i < arr.length; i++){
      px[i + 1] = px[i] ^ arr[i];
    }
    final dp = List.generate(px.length, (_) => <int,int>{});
    for (int j = 1; j < px.length; j++){
      for (int k = j; k < px.length; k++){
        final xor = px[k] ^ px[j - 1];
        dp[k][xor] = (dp[k][xor] ?? 0) + 1;
        res += dp[j - 1][xor] ?? 0;
      }
    }
    return res;
  }
}