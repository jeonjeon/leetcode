import 'dart:math';
class Solution {
  int maxEnergyBoost(List<int> dA, List<int> dB) {
    final dpA = <int>[dA[0], dA[0] + dA[1]];
    final dpB = <int>[dB[0], dB[0] + dB[1]];
    for (int i = 2; i < dA.length; i++){
      dpA.add(max(dpA[i - 1], dpB[i - 2]) + dA[i]);
      dpB.add(max(dpB[i - 1], dpA[i - 2]) + dB[i]);
    }
    // print(dpA);
    // print(dpB);
    return max(dpA.last, dpB.last);
  }
}