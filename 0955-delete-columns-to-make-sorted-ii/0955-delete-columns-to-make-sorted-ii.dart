class Solution {
  int minDeletionSize(List<String> strs) {
    int res = 0;
    final done = <int>{0};
    for (int j = 0; j < strs[0].length; j++){
      bool del = false;
      final temp = <int>{};
      for (int i = 1; i < strs.length; i++){
        if (done.contains(i)) continue;
        final prev = strs[i - 1].codeUnitAt(j);
        final cur = strs[i].codeUnitAt(j);
        if (prev < cur){
          temp.add(i);
          continue;
        }
        if (prev > cur){
          print(j);
          del = true;
          break;
        }
      }
      if (del) {
        res++;
      } else {
        done.addAll(temp);
      }
    }
    return res;
  }
}