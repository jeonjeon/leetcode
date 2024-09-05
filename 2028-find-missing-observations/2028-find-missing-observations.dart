class Solution {
  List<int> missingRolls(List<int> rolls, int mean, int n) {
    final res = List.filled(n, 0);
    final total = (rolls.length + n) * mean;
    var rest = total - rolls.reduce((a, b) => a + b);
    for (int i = 0; i < n; i++){
      final div = rest ~/ (n - i);
      if (div < 1 || div > 6) return [];
      res[i] = div;
      rest -= div;
    }
    return res;
  }
}