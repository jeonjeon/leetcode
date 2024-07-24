class Solution {
  List<int> sortJumbled(List<int> mapping, List<int> nums) {
    // Get tuples (index, mappedNumber)
    final records = <(int, int)>[];
    for (int i = 0; i < nums.length; i++){
      records.add((i, getMappedValue(mapping, nums[i])));
    }
    // Sort tuples by mappedNumber
    records.sort((a, b) {
      if (a.$2 == b.$2){
        return a.$1.compareTo(b.$1);
      }
      return a.$2.compareTo(b.$2);
    });
    // Map tuples (index, mappedNumber) to number in nums
    return records.map((r) => nums[r.$1]).toList();
    // Done ^-^
  }

  int getMappedValue(List<int> mapping, int n){
    if (n == 0) return mapping[0];
    int res = 0;
    int top = 1;
    while (n >= top * 10){
      top *= 10;
    }
    while (top > 0){
      final div = n ~/ top;
      res += mapping[div] * top;
      n -= div * top;
      top ~/= 10;
    }
    return res;
  }
}