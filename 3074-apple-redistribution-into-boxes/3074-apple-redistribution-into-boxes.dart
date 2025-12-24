class Solution {
  int minimumBoxes(List<int> apple, List<int> capacity) {
    int tot = apple.reduce((a,b ) => a + b);
    capacity.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < capacity.length; i++){
      tot -= capacity[i];
      if (tot <= 0) return i + 1;
    }
    return capacity.length;
  }
}