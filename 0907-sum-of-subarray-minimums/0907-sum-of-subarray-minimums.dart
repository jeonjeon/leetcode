class Solution {
    static const MOD = 1000000007;
  int sumSubarrayMins(List<int> arr) {
//       앞에게 작을때는 left++
//       앞에게 더 클때는 res += left
      final lessIdx = List<List<int>>.generate(arr.length, (_) => [-1,-1]);
      final preStack = <int>[];
      final subStack = <int>[];
      int res = 0;
      for (int i = 0; i < arr.length; i++){
          final reverseIdx = arr.length - i - 1;
//           앞쪽
          while (preStack.isNotEmpty && arr[preStack.last] >= arr[i]){
              preStack.removeLast();
          }
//           뒤쪽
          while (subStack.isNotEmpty && arr[subStack.last] > arr[reverseIdx]){
              subStack.removeLast();
          }
          lessIdx[i][0] = preStack.isEmpty ? -1 : preStack.last;
          lessIdx[reverseIdx][1] = subStack.isEmpty ? arr.length : subStack.last;
          preStack.add(i);
          subStack.add(reverseIdx);
      }
      for (int i = 0; i < lessIdx.length; i++){  
          res += ((i - lessIdx[i][0]) * (lessIdx[i][1] - i) * arr[i]) % MOD;
          res = res % MOD;
      }
      return res;
  }
}