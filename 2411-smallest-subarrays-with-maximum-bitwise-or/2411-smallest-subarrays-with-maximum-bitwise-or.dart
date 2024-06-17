class Solution {
  List<int> smallestSubarrays(List<int> nums) {
    final res = <int>[];
    final arr = List.generate(nums.length + 1, (i) => List.filled(30, 0));
    for (int i = 1; i < arr.length; i++){
      int n = nums[i - 1];
      for (int j = 0; j < 30; j++){
        arr[i][j] = n & 1;
        if (i > 0){
          arr[i][j] += arr[i - 1][j];
        }
        n >>= 1;
      }
    }
    //print('arr: $arr');
    for (int i = 1; i < arr.length; i++){
      int l = i;
      int r = arr.length - 1;
      final maxi = rangeSum(arr, i, r);
      //print('i: $i, r: $r, maxi: $maxi');
      while (l <= r){
        final mid = (l + r) ~/ 2;
        final midSum = rangeSum(arr, i, mid);
        if (i == 3){
          //print('l: $l, r: $r, midSum: $midSum');
        }
        if (isSame(maxi, midSum)){
          r = mid - 1;
        } else {
          l = mid + 1;
        }
      }
      //print('i: $i, l: $l');
      res.add(l - i + 1);
    }
    return res;
  }

  List<int> rangeSum (List<List<int>> arr, int s, int e){
    final target = arr[e].toList();
    final prev = arr[s - 1];
    for (int j = 0; j < target.length; j++){
      target[j] -= prev[j];
    }
    return target;
  }

  bool isSame(List<int> arr1,List<int> arr2){
    for (int i = 0; i < arr1.length; i++){
      if (arr1[i] > 0 && arr2[i] == 0){
        return false;
      }
      if (arr2[i] > 0 && arr1[i] == 0){
        return false;
      }
    }
    return true;
  }
}