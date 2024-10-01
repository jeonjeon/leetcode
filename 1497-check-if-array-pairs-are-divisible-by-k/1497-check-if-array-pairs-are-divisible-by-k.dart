class Solution {
  bool canArrange(List<int> arr, int k) {
    final mods = List.filled(k, 0);
    for (final n in arr){
      mods[n % k]++;
    }
    if (mods[0] % 2 == 1) return false;
    for (int i = 1; i < k; i++){
      if (mods[i] != mods[k - i]) return false;
    }
    return true;
  }
}