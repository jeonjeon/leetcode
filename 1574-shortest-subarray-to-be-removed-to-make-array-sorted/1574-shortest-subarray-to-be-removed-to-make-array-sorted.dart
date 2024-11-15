import 'dart:math';
class Solution {
  int findLengthOfShortestSubarray(List<int> arr) {
    if (arr.length == 1) return 0;
    int ml = 1;
    final stack = <int>[];
    for (final a in arr){
        if (stack.isNotEmpty && stack.last > a){
            break;
        }
        stack.add(a);
    }
    ml = max(ml, stack.length);
    // print(stack);
    for (int i = arr.length - 1; i > 0; i--){
        if (i < arr.length - 1 && arr[i] > arr[i + 1]) break;
        while (stack.length > i){
            stack.removeLast();
        }
        while (stack.isNotEmpty && stack.last > arr[i]){
            stack.removeLast();
        }
        ml = max(ml, stack.length + (arr.length - i));
    }
    // print(ml);
    return arr.length - ml;
  }

}