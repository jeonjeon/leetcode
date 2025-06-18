class Solution {
  List<List<int>> divideArray(List<int> nums, int k) {
    final arr = List.filled(100001, 0);
    final res = <List<int>>[];
    nums.forEach((n) => arr[n]++);
    var temp = <int>[];
    for (int i = 1; i < 100001; i++){
      while (arr[i] > 0){
        temp.add(i);
        arr[i]--;
        if (temp.length == 3){
          if (temp.first + k < temp.last) return [];
          res.add(temp);
          temp = <int>[];
        }
      }
    }
    return res;
  }
}