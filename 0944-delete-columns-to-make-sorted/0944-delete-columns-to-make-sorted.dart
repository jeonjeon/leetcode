class Solution {
  int minDeletionSize(List<String> strs) {
    int res = 0;
    for (int i = 0; i < strs[0].length; i++){
      int prev = 0;
      for (int j = 0; j < strs.length; j++){
        final ord = strs[j].codeUnitAt(i);
        if (prev > ord){
          res++;
          break;
        }
        prev = ord;
      }
    }
    return res;
  }
}