class Solution {
  bool canBeEqual(List<int> target, List<int> arr) {
    target.sort();
    arr.sort();
    for (int i = 0; i < arr.length; i++){
      if (target[i] != arr[i]) return false;
    }
    return true;
  }
}