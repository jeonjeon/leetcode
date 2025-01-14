class Solution {
  List<int> findThePrefixCommonArray(List<int> A, List<int> B) {
      final numbers = List<int>.filled(51, 0);
      int cnt = 0;
      final result = <int>[];
      for (int i = 0; i < A.length; i++){
          if(++numbers[A[i]] == 2){
            cnt++;
          }
          if(++numbers[B[i]] == 2){
            cnt++;
          }
          result.add(cnt);
      }
      return result;
  }
}