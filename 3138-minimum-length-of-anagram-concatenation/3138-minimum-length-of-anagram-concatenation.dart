import 'dart:math';
class Solution {
  int minAnagramLength(String s) {
    final a = 'a'.codeUnitAt(0);
    final arr = List.generate(s.length + 1, (_) => List.filled(26, 0));
    for (int i = 1; i < arr.length; i++){
      final ss = s.codeUnitAt(i - 1) - a;
      arr[i] = arr[i - 1].toList();
      arr[i][ss]++;
    }
    
    for (int i = 1; i < s.length; i++){
      if(s.length % i == 0 && can(arr, i)){
        return i;
      }
    }
    return s.length;
  }
  
  bool can(List<List<int>> arr, int len){
    for(int i = len * 2; i < arr.length; i +=len){
      for(int j = 0; j < 26; j++){
        if (arr[i - len][j] - arr[i - len * 2][j] != arr[i][j] - arr[i - len][j]){
          return false;
        }
      }
    }
    return true;
  }
}