class Solution {
  int chalkReplacer(List<int> chalk, int k) {
    final sum = chalk.reduce((a, b) => a + b);
    k %= sum;
    for (int i = 0; i < chalk.length; i++){
      k -= chalk[i];
      if (k < 0) return i;
    }
    return 0;
  }
}