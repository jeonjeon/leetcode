class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    final left = <int>[], right = <int>[];
    for (final n in nums){
      if (n < pivot) left.add(n);
      if (n > pivot) right.add(n);
    }
    final pivots = nums.length - left.length - right.length;
    return [...left, ...List.filled(pivots, pivot), ...right];
  }
}