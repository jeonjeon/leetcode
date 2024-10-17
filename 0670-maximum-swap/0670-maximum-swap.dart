class Solution {
  int maximumSwap(int n) {
    var arr = <int>[];
    final sortedArr = <(int, int)>[];
    while (n > 0){
      arr.add(n % 10);
      n ~/= 10;
    }
    arr = arr.reversed.toList();
    for (int i = 0; i < arr.length; i++){
      sortedArr.add((arr[i], i));
    }
    sortedArr.sort((a, b){
      if (b.$1 == a.$1){
        return b.$2.compareTo(a.$2);
      }
      return b.$1.compareTo(a.$1);
    });
    for (int i = 0; i < arr.length; i++){
      final (sn, si) = sortedArr[i];
      if (arr[i] < sn){
        // print('i: $i, arr: $arr, sortedArr: $sortedArr');
        arr[si] = arr[i];
        arr[i] = sn;
        break;
      }
    }
    int res = 0;
    for (final an in arr){
      res *= 10;
      res += an;
    }
    return res;
  }
}